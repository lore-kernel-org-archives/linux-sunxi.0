Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911952;
	b=0MbD2NoI7Alz4RaAr3vG6oXQuRB1A259UUlqtOcb7vs9Abx3hFkKgkaIQyXDfydL4jis
	 +yBkEfaqzJBl34C+4aRiyv4zTQwher1ZEyH3T8twSGCwpTRI3PLvQ2tSCAV6Ub+DC+o1/
	 vF71KfsR+0iTGg8xDu+gnDWIF3OqX33LxVk3j52wsfhVENFROY3JWeAfT6g+xTNgae4In
	 qvu9iRHpwTAd5t1TF/wRrjTNKB7t8b2U9Q05wLH/BPfKEerRNFRRxkJmFjGKvYlyaNBuR
	 Aq3ykIddOz94bioN/rUbKpCq0MbJXG2OTApBQsO5o0/MeOLUtuNIfH1QN5zGOtyTf7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
	b=Jn1R+jK2Mqh7oYf2OHoIjLF2groYIVemE0xGncKye7OrvyBhL4fgGYjNA505Sjupa/04
	 On19VLyxZkr/IAvLw8Gvx6u3IzzUCQoKASBeXzIpjWISF05LEOK7wbEqAx0GQY8r38fYI
	 q98EHZpUQh24RxPkk42KuPXDx5G40nzVaV4wthSp6Ajs4sneiaJMhdG5f4lq2f5Lsw5u7
	 VQzFQwCORDq6trsnze0rG4xZiibn5xCiYjAWHlE4IB7Au8NNign/k+BTT7VaDABT+kY89
	 Xf74zvaOKtkRYBRYxkUEtpl32H0OzCjA8fZyiYEPDzq1d8Q64yn7yIgdahiS3nY08ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OlZzi/da";
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC687606D827
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 20:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC687606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OlZzi/da
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-833e671ee9fso16980a34.0
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 12:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911951; x=1794516751; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=OlZzi/daWhysLhGd4+L17/0cgXaRd+9TTadefL0L7+Oyf+XxGIcC5HXgaZthth7mYT
         dyhgssu3ReA5cCoUTwxCqXfZGe2B9caDzAe4wvrJhAWuR0EMl4TZtvSdBl9iGLYFPxtk
         GxocE8ZYJvRPaKC1xoO3wfDu7iFPM/s2HzZxG2qsr3UI2f7ye05ZSbw2ccvCuFseGRRM
         +g0FEhy4nVZ6ZPdxOdoW1jKtT0A9SI0ItlOeNodeluHrkWzCOIjOU5HlYsUzyG4hF2d9
         xXVm3+wcZ8EJSsbetTKIgEhOzTYraAFtt3d1IClYVdSPwCoDaIXSP7U/7HnDsQBvKAWg
         ta7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911951; x=1794516751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=DzibuaCyLmlPsre//4kSQ+dAKYchFG4pZRdmpga5yPSjn4B+L17ia75tE7Fon3Vaq7
         JI1iifJCgeM3+P5/4TTt9W2Sim6L2y3uyCQNf1AzIUr5oUv8gtQDAI/6cpS05sLZ1Pyk
         +O1wsy//oIr1ZIbsyJi1aYM776Iw8tBpej4kueGWXq8Z+GHspZva7I9fCoYEYdMyEFuP
         x1Jzq4ejcswFJ1jwzImQgBFVtNyFC+AVihaeKxP3lYOSHJtxO4j5ta/d/WZ6e3PCly/l
         3KW9WCbGT3pjFrdClAC3cO2SaU7g5dpJegmPf+Pt481r01UWujEF0hSAia43ILTUm97V
         mqOg==
X-Forwarded-Encrypted: i=1; AKwUvBwNgEq1tvUzCv7U1G08jW09+YkSQUlgElAoqL3CTkGuce7RWLKmq0w9/+rmQj1X+b4rltKsqf4NYTaROg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/PEkl16wZZQleHOCwDEFBut5egVgGaK/JtqNCtiEil0Oksycj9
	iGdc5Z7rMgmF34yII9q+4lJlyPzFVJ9IcE1haD26k7CIKEvWq+Q8AuT9
X-Gm-Gg: AYBFou2E/OGhFOpe7b/6JF1yFRj+QNl4DWu8IwvXmygxaG9BTbI84vUfzMI2lehJLC4
	Rp++4mq1vSwFkYoZscaB+V9MzGKAOgNKLbk+EV5hWJu4b1FqHFD4v6PQ9RL5yUbpQqEwtjtblrJ
	Yk1lTb/CvZlmsKZhZfb3Eh7HazOoobuF6/hNOTf6YyZ/RbKz7k2QXzp9RBbYUWa6iqj10GKswUh
	IVbK9KM0p58GKb8AbtkTcLP4xmnUKakKae13tT9BlB6a9BxDiJZQM8CNHPTc2Eb5bbkGcHvp64T
	20dapiNgM/84lOAPWlTsjlHfQ/z0VkhqLpYKE0+6TYIbmEXtpx+9xIqNtopynzi1AqJ7SzZaIuk
	CdIFPayGXV33EOvrcCI5rwo1Y3WJ61vQNvxi/nR3u9zT2N2czXvvHNrTkqGUvm1Z6jxkmWXC1kH
	ESkrUa02IjiHhF5uRaolXOhXQtrICa4++xviHLfU+BO9ekKCb9C8r0B8R+8jvxfijuk/4x2dr8g
	F+30htmixRvMdnwZn/3FGvCDdYPADHrY8bqGnM+0DM/q0M/pSO4YjPgD4k8xCzgUzi7jnfoopZS
	lv6CKqL/m2Ggyq8nb+QU2yDsLekoelhyrooJyB/VBTCkn/fwvfDyHM1o8uVGeJ7FtJd1JPWrdZT
	i6fxCASuxBFOSNnsJxUFmAiIVBcPXhWcy0vETnLIUlm5qvzgJ9QLmXgCQphMoJA+9BKc/MRN8vE
	r29zaoRNLg7Wb6lbAq30BaK8SX/YrP9uWsgWB5CfmckPgC4VBenS8=
X-Received: by 2002:a05:6830:4c03:b0:81d:54f9:d6a3 with SMTP id 46e09a7af769-85f1ce073bfmr525242a34.4.1793911950589;
        Thu, 05 Nov 2026 12:52:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:10 -0700
Subject: [PATCH v8 09/11] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner A523
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-9-14024d2b184b@gmail.com>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The A523 UART integration has different FIFO depths across its controllers
and reports each controller's depth in the FIFO Clock Control register.
The receive thresholds follow the standard DesignWare FIFO-relative
mapping, while the optional-register layout differs from the generic
DesignWare integration.

Add a compatible for this integration, also used by A527 and T527, with
snps,dw-apb-uart as a fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index fc1289073241..ea6ce99178e3 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -61,6 +61,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun50i-h616-uart
+              - allwinner,sun55i-a523-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0

