Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA4815BB
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Jul 2023 09:18:34 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b6fdaf6eefso41668861fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 15 Jul 2023 02:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689412712; x=1692004712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ml0O9v4adwaXBJEIaQ084479cQpZdd+qXOYWMXt4ElA=;
        b=XXh3zvoVnJjyw+Vw1oB7KtQZbYBRIaUkMaa2x991IFW0s/OZ/kSSYGNrCDOxKTKYSS
         ZL8VA1Eu8gzIpmqN46PkaZpKdMzSsNwWOOYDfbN2WMv5nLEcrIJZPdhk5Apgva7LqSvX
         Mep8qlq7D+CRYNI+eWLfM1wLJIyhu41m9AnwXuNl0sjNWTtoCDbXVO1Eeii8QIXK+4FO
         v+TMjRBVlMlfwrL8USiNrcmwZcVnsFD12XaaKAARJlULo4cqpaYlLtUmKaK2d6Nkekka
         Uc7865qWaLXql6ZXEjTwVN+E0gH+luOuNY6Nur8QLI1EoasrBJax258VzZHzgw+gi8Vw
         N3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689412712; x=1692004712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ml0O9v4adwaXBJEIaQ084479cQpZdd+qXOYWMXt4ElA=;
        b=hrAEEU58Jnk4mkPElW6qvOj4JJKunWz3eDzUWch+zW6kTFNtClrltFHZiQdJ0gbNZ8
         5jFwNRwE3iugtqzj843dL2x0YDNG63gf/Z3Q449tOwpKrTE+Nsrptpk/AiVHeSeTk0JB
         H0XG6EOPErftUPR2klp4VrF3L/X7kcw9U5G6V1hSmzLvEHecr2UeRhvjWuUhnzTysbhB
         Q3rnhpnaMewCD3wnryOIp/6YnFMjGo7K4qKiPA5CkdByr+5QE2rcwU8yi6JKCQn+PDBQ
         FdGladQp2gUtYkqMb/8XPW18ODrt0zzkMPb9Ru/RUdDzBWgBX6F7Nr0615oz+XogyOzT
         k9nw==
X-Gm-Message-State: ABy/qLYvcoW30kZ7zF+Widny+9uogs5Qv/eG5SP5zBkFqposuo5j9QjE
	M1nlLE9wQo0DFRTkswU3RDc=
X-Google-Smtp-Source: APBJJlH2MjuUkNhIv3D5y271CR9dnERIGeG6VJrEdFCX/0Z5fkvnvbXOAyVQ9MxF3mJap1rTA1eULA==
X-Received: by 2002:a2e:9bcb:0:b0:2b6:dec9:2813 with SMTP id w11-20020a2e9bcb000000b002b6dec92813mr5993004ljj.29.1689412712645;
        Sat, 15 Jul 2023 02:18:32 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id b17-20020a2e9891000000b002b840f283a7sm561784ljj.36.2023.07.15.02.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 02:18:32 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v9 1/4] iio: adc: Kconfig change description for Allwinner GPADC
Date: Sat, 15 Jul 2023 12:18:13 +0300
Message-Id: <20230715091816.3074375-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230715091816.3074375-1-bigunclemax@gmail.com>
References: <20230715091816.3074375-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoCs names to Allwinner GPADC description to make it more informative.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 drivers/iio/adc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index dc14bde31ac1..5f1e9bb59623 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1116,7 +1116,7 @@ config STMPE_ADC
 	  built-in ADC block (stmpe811).
 
 config SUN4I_GPADC
-	tristate "Support for the Allwinner SoCs GPADC"
+	tristate "Allwinner A10/A13/A31 and similar GPADCs driver"
 	depends on IIO
 	depends on MFD_SUN4I_GPADC || MACH_SUN8I
 	depends on THERMAL || !THERMAL_OF
-- 
2.39.2

