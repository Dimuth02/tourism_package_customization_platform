package com.example.TPCP.util;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionType;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

@Component
public class JsonDbUtil {

    private final ObjectMapper objectMapper = new ObjectMapper();
    private static final String DATA_DIR = "src/main/resources/data/";

    public <T> List<T> readList(String fileName, Class<T> clazz) {
        try {
            Path path = Paths.get(DATA_DIR + fileName);
            if (!Files.exists(path)) {
                return new ArrayList<>();
            }
            CollectionType listType = objectMapper.getTypeFactory().constructCollectionType(ArrayList.class, clazz);
            return objectMapper.readValue(path.toFile(), listType);
        } catch (IOException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    public <T> void writeList(String fileName, List<T> list) {
        try {
            Path path = Paths.get(DATA_DIR + fileName);
            Files.createDirectories(path.getParent());
            objectMapper.writerWithDefaultPrettyPrinter().writeValue(path.toFile(), list);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
