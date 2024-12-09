Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB3121B8F5
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Dec 2024 11:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733744562; cv=none; b=dcH+lEnU6ePr8sbF8xkjqmy/rizrun/RpAq/Qxxo9NOdCWZ+XXYCs5oARimGzhuCPYIZMgnvTC3WrTIu+1IwC3R5NGtIrsammrmSEXFtZuJDVMc6yei6fm/YKYLGyerKydraqS5viMvSZo5LMPi51sLjwV04+YuUPpn/KL7rUxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733744562; c=relaxed/simple;
	bh=IK6FGWxcat9ec7DwdOXaucjjIx7nIWIyPdA4xF3OYr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=S4YKy1y0XDDEIcZORfv+bYc8vr27Zf+Qtkv+CI5lZ0J425FXWdqMarmGLd2VANPM6fp/b4DpT5Z7bYYqMVOj708ofuTWNnnBAd9RoDGtnxQZzEYRN2WK0Y5idgNEX9rIg1S65t/sx95rFYCHCxN45YgcHudrTZPE5CZl4iZl+0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NsHP7VEC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NsHP7VEC"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434f30ba149so7556375e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Dec 2024 03:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733744559; x=1734349359; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W10XgeMj5m+No6tcPataZmZSnoW6PK2I9Ff3cBJBg7k=;
        b=NsHP7VECED4XmIvoadA9CKFNn4axzBmYcxcVt7fegZqa9XGUGQFIcAhHVhV7m7gArV
         ngasTEc342AlVVC2pY8H0OzSf5TWON2O89wDA2HbU3Vn7RiigMwb7F3X3EKlr1quXpFD
         B777t24+8uIRAADwx0bLqbSMEpA2MkFzL4j3ZNzRP+pdO4DH7EZxJxm/InsggZHdGIeX
         YV/En5exXutcpMwM1LjvKn10Q0fqjgQf80/R1yDWp37slwNA5NUXucmp1U8k2bmgLw2t
         mMesjEgzY2iYbSgM1Is0p6CBZ7ba+MmMw9jF9G8pkFb1dEeqTnfPdclAj8Rmg7/lUsPV
         AVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733744559; x=1734349359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W10XgeMj5m+No6tcPataZmZSnoW6PK2I9Ff3cBJBg7k=;
        b=sVFPgSdGnXbw8676Wp8yyvYP1nHqUA2X6Hjl0PYoX2OWB4Luq2ll5K3Ms7XUEpgeqm
         K0wULS1mXclrD0H3OLZniFqo4VevWpqFVa5rDf2cqO9wSvGFTIVQ8aqXy+63oH6tSmuw
         RR4+DyABGuKKQBxIzcGNwV42Q5Y9JXY5evPf8nySE/Cjwe28X2ImofDe1RtsVhSvC1CM
         A4RA3U6SqkZw7+lckBsjyu6zqZ7/NO5HMN8qosrZ1ElM6ALV/TGgog2L+lEeLRC/myhl
         sxJ6K7bx0B1kqUQxAiB1U0dQ9KHYHvDxw7dd/y0znNkHR8ShY6OxP9RllIXzWk2xUyzw
         sVcg==
X-Forwarded-Encrypted: i=1; AJvYcCU+csC8DpLxCjVr2CLD1uwLc9gXCfSlODGbm0OH9VZV5m/DXBUsfFgtP3zbVQOvZf31JTakjiImamK8HA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywknaze24MFrn0P6AZNFrq+fSom2qjJnq4u46mwxXyUZwR2Bpxi
	qscd3OKzfHaI1G23NkAtTqRThpnhvXpqfUaDJnHnDmFZqX6Rrp4jLlCClG/9ndY=
X-Gm-Gg: ASbGncvQd9Y3x4XNGe4LBpgc5H4rBlkgBs1Nt+aEpWDCOOZdp4XMGOBP6ggHTYgB/hu
	G6f0MWKHr0rpKuDNtLLj1fiP1oO4LjsmXssc5YlAMUfqwagpViXPxGQP7WVq7CIcf01yjSsMOYQ
	dUvIIF21ID+OdzcKdjo4jzLmwn0VNuDaUpSdRIkI8gg4r48r32EmWPGxa2u29vNvbZpWzXPuU1H
	b8kjb29z+waFDCrAx89N2cmaYB/NXy7yYJR4yTnHfnjp/PQpCW5JVPgdOe/754=
X-Google-Smtp-Source: AGHT+IEbIQYg8EnIUDUPigKjpDEo3nHZn5oUqp1eGUTq6LEGGzSr1WjwD8bOZqQ7VZz3k53CLChrPw==
X-Received: by 2002:a05:600c:1da7:b0:434:f871:1b97 with SMTP id 5b1f17b1804b1-434fffca42dmr648225e9.33.1733744559181;
        Mon, 09 Dec 2024 03:42:39 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f2b08972sm60014355e9.27.2024.12.09.03.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 03:42:38 -0800 (PST)
Message-ID: <c8f42175-3501-4d65-92ba-5878fe5ea5f4@linaro.org>
Date: Mon, 9 Dec 2024 11:42:35 +0000
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] media: dt-bindings: trivial white-space and
 example cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 Shijie Qin <shijie.qin@nxp.com>, Michael Tretter <m.tretter@pengutronix.de>,
 Emil Velikov <emil.velikov@collabora.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20241209113405.74226-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241209113405.74226-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2024 11:34, Krzysztof Kozlowski wrote:
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> index 9cc0a968a401..3469a43f00d4 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>   %YAML 1.2
>   ---
>   $id:http://devicetree.org/schemas/media/qcom,msm8916-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> index 5cb0e337ea6e..644646de338a 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>   %YAML 1.2
>   ---
>   $id:http://devicetree.org/schemas/media/qcom,msm8996-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> index 584106e275f6..68d8670557f5 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>   %YAML 1.2
>   ---
>   $id:http://devicetree.org/schemas/media/qcom,sdm660-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> index d32daaef1b50..289494f561e5 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>   %YAML 1.2
>   ---
>   $id:http://devicetree.org/schemas/media/qcom,sdm845-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> index 06db2c1e6079..a372d991e652 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>   %YAML 1.2

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
