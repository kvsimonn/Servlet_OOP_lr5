import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Car implements Serializable {
    private String make;
    private String model;
    private String body;
    private int year;
    private String capacity;
    private int id;

    @Override
    public String toString() {
        return "Car{" +

                "make='" + make + '\'' +
                ", model='" + model + '\'' +
                ", body='" + body + '\'' +
                ", year=" + year +
                ", capacity='" + capacity + '\'' +
                ", id='" + id + '\'' +
                '}';
    }
}