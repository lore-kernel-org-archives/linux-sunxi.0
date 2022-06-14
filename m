Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE421FC1
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Jun 2022 20:29:03 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id o7so19376809eja.1
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Jun 2022 13:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6vo5ChNd9bkGZCbil2zL+tyn6URWu9ehHcF9fcX0yBw=;
        b=GF5aqrG6+jO62KEf5kyJY6HiXbGBaETgNAiygw076aURoVfHfYn38EKb05/kUjm0NR
         xeJ5zImPDgo7yV9SHaAA7MQHEAZpmWM/TyijVmRnTfHoj2GIsQVqtrxaZmJqBRg99KaI
         TIrnhtNgQrwJl1o5/AbL6Ur/ML34SOjx9iMd7NrMAnEVgz8wcPJ5Ag7scAHMHKSABykY
         2IHOuvzd9ZBwMUIjIkQegQ9dzH54zcekWPMbp1Jk4M+YkZJyTZvMW+nPFpYKtYIGKayZ
         XZpP9ERjH4BDLr1lgzKHdq4McSM0vBrwHPTFOjC4CJA+0sCeCT4KaMy5Lgzti0Ekya+k
         SJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6vo5ChNd9bkGZCbil2zL+tyn6URWu9ehHcF9fcX0yBw=;
        b=4gUwaRWIMCPtnE5yGzyKWdkLZCvAwHr1IVpaBJSh2RJEVYrRWFpD+MRx1/6+Cd3DLl
         Yf7xJKAb0JjJr9lyXr/BFhKEXVN3lun2A6KC1T2/igbj5g1pRJDVUO5PmD2haZ9aGz9/
         KVYugsSj+DNHzEGCx1OeOqcLIg8DFRoRdAHOJRbNOK8HuluxVpz8zFVAXTJZtU5yA/AH
         HtLYfV8/TVvmp7QkT8uaeAVkCGx6Hs2nf2f7cyuEadef84Vv8ULmQW8G1ldDQOY1MKlu
         oh2j/PC7q2FeD29o8SJGns9h4Zx4IQig0HtHlh4dtX2eAc/NA4TMKcsbs7B+1e6rHXaZ
         GYGg==
X-Gm-Message-State: AOAM531WEf3oJmrSHj4q4O5kuWYZJqhrYXJhI0+e2EMo0rXOkWQydbWo
	kViZnA2SIzDSaukTGXjqxndC3YgJ67kqVQ==
X-Google-Smtp-Source: AGRyM1uBU1KCDF7xHMhWGVWcFkxuu2ljGCZQBrr9mJ2TRsZvMkGcbgRdTjujq3Suu7GDx3XkIUzwgw==
X-Received: by 2002:a17:907:9715:b0:711:ca06:ca50 with SMTP id jg21-20020a170907971500b00711ca06ca50mr5968019ejc.192.1655238542217;
        Tue, 14 Jun 2022 13:29:02 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id k24-20020a1709062a5800b006f3ef214dcdsm5448604eje.51.2022.06.14.13.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 13:29:01 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: Re: [PATCH v2 06/48] ARM: dts: allwinner: align gpio-key node names with dtschema
Date: Tue, 14 Jun 2022 22:29:00 +0200
Message-ID: <2184827.iZASKD2KPV@kista>
In-Reply-To: <4743697.31r3eYUQgx@kista>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org> <20220609113911.380368-5-krzysztof.kozlowski@linaro.org> <4743697.31r3eYUQgx@kista>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne ponedeljek, 13. junij 2022 ob 23:02:22 CEST je Jernej =C5=A0krabec napi=
sal(a):
> Dne =C4=8Detrtek, 09. junij 2022 ob 13:39:08 CEST je Krzysztof Kozlowski=
=20
> napisal(a):
> > The node names should be generic and DT schema expects certain pattern
> > (e.g. with key/button/switch).
> >=20
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied, thanks!
=20
Best regards,
Jernej



