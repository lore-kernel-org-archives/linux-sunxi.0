Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582467A
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Jun 2022 21:02:30 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id w27so8873366edl.7
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Jun 2022 14:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q+yaULdwu+rPL5G3MbWME0SaA5eeeXALvtNnWDC8wYA=;
        b=Z3Zp+je1tvgRYJne1HFf3ZU8TV5rQ6wVEdKi2Ozg9+v/gZF1Q7EdGSU49t7iJbACzr
         T60Bn+ddWAdg5eWnfRIB9uAQwPTuvHmXB917v7IPvts0r3jpZWWefU7QacBSK9uwNFZN
         c8GDDbZqjrTisqwCR/vGfpKSHzXLv/V+6/OyOkGb3CTI6/dQ/4ke0F++EiV+3On1WacQ
         mGnKAGI887a7ydBLuwYrYT6GHYTtqoYE77UDQ/X/KatV2tWb1fkYwcG9r1PuYSR9PBZZ
         /+aq1qaKfHXxUomXC+UZrSaEeyNsTVPKnZeOxKLokpF8ku2eturrAlCy4DJg5gNozN0P
         fAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q+yaULdwu+rPL5G3MbWME0SaA5eeeXALvtNnWDC8wYA=;
        b=fz+hWoZNezWpePymVEhSzLbQfd4SbdMMl08ZoyrWFkwO7YMLL/s4WzWZX4tjMysDDP
         N/FLZHIoYRTcgdm+vRixGPKHDWseK0yeo6jDJoWVtl2vDkX3UgVkg4OMplwMxRbcqzUo
         qreFutJuKAj5ksbnHgdHu0weNIvfayTAfBxc0hojv2YDcRDlUvPZdK+ZcJdUVQGvHwtN
         de2pPFL8gp+aOQDn9mBjrF1w2S0QCMW3QwmM0nXtOGIJDr0U+K4lQiVWbolZGZ+zODKj
         ENQJUD4ZrZ0RjlT7y4O/Lw1km24F8vqYwyeNU/s1JycBhnyOITwsPmWzhrl5KrpPH+Q+
         cwAQ==
X-Gm-Message-State: AOAM532f0nHg05SEAtECkAxUf1u6XqX1Kzjy7x0rsl78H1MiCnPjKXwg
	PWcHf72kqpjbM8JH7fXEREc=
X-Google-Smtp-Source: ABdhPJxQQjQlNd90jfnjQ5cdDCsNYWfxsyeGYqf4sXuU6zLN/1BV9Z4Vj7CJU7eESLv+NSnM2GcZAQ==
X-Received: by 2002:a05:6402:3293:b0:42e:18a:d6eb with SMTP id f19-20020a056402329300b0042e018ad6ebmr1871193eda.293.1655154148518;
        Mon, 13 Jun 2022 14:02:28 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id q23-20020a1709064cd700b006feed212f50sm874123ejt.184.2022.06.13.14.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 14:02:28 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 06/48] ARM: dts: allwinner: align gpio-key node names with dtschema
Date: Mon, 13 Jun 2022 23:02:22 +0200
Message-ID: <4743697.31r3eYUQgx@kista>
In-Reply-To: <20220609113911.380368-5-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org> <20220609113911.380368-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 09. junij 2022 ob 13:39:08 CEST je Krzysztof Kozlowski=20
napisal(a):
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


