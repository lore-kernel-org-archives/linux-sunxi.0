Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C449220B34
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 09:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713085645; cv=none; b=j2JNwL6/obENhCd13+z2sIza+4VvvCy1OxTFgi0yDmTHcVVYWbd4E8abA3W9PTCqHvvIxHdK9BF5ET5bU9WwYeF+8lEW9sJhzuNJXVeTUeSxbWqIp/JDoIf7+1qtYWs51seMpDFTY5CMYL6Azm1lzSqfjINpzNQwnbwRshvWbak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713085645; c=relaxed/simple;
	bh=BjKU5+T5fs+RM9cbIhVQr4EcL4DjffzBvTs4ER4XO3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DXFt+HhzFZMfshOVXm/FL6DWQe1Kh2/HwRAEOBvM5dBShKron68Mu6tqeq65rUwnbo4BQoZD22OeBwM3wjuGxDJ6bEo5sLzP+RsI69vcHGcxEozql4RWPZYXSy2C1mCbGhbSLupqoMC+jbmfL8pgJ/kkiGyAcaGh+52ir6Wpr1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=owGK2ClT; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="owGK2ClT"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a51969e780eso294760266b.3
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 02:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713085642; x=1713690442; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6ICUCQVmIfh08qGekJz3o0+EeQNUcRqwC4WLDD5uz0=;
        b=owGK2ClTYhhUpJmmTgtxWwn6w3VrOurv6DDtsRV/Wqif5dPdx6iW+GWWCEGsJLkhGC
         5cR6rY4J3N9Ia2lPUIHF6hj0qguzAUArHZp7VC1bxGthLxgPMMZ79Vd4KLKiWHrH5cWH
         OsRRyCXT5/o+DVj8qjeyUNdW6qsLMzGy8Vgmogly8MBnsiBtmPZC6bXMctaNhpGKgpEO
         tbhPnR/MmwQpFeZ61kP55YEIBl6kryVjOLSjNX77crVU5gb+JZxFHXkWhKdYXlSmW+iB
         r839CxG8aY9o9Oxm7uTrR/Tr77ly/zv2IK8z4hFEyiL9pmctHvxKBxdKDwcdIb0HKkrs
         kq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713085642; x=1713690442;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6ICUCQVmIfh08qGekJz3o0+EeQNUcRqwC4WLDD5uz0=;
        b=kUtRCYWkR+Tifa9U251j6tmNXJj5iqs79KFdbVpXQhG5U+jZQvhMGPSEfWynxbAeoC
         XnFdJtAvMppoC1s60T7mKPAEjTyeepfAAw+cqNgzo9iLi1sGtme2uUfaZNsUEblcUIX4
         E33hh1TX+mTZW0641R1MBSXRaqCMgAZ2jUJGgsId2wahBajTQq4YqQyT1GdIZZEOdnIo
         sCrKAFZKhKD4MB3PBAreT/BqDfAAGTbcHMeA+pHGKGklKHKF/BJZWO5gwsaswSa7ZAcz
         5Ob9H5JSIN4vIg14+5IvuPDdI9SGQm7EuBg8nA8m5lGYeBrGiJXhGqGSMfSGZey+R2MV
         Sghw==
X-Forwarded-Encrypted: i=1; AJvYcCXvCxM58UF/FiKVlKVgL9BEgQ8pPRJx3QjEyN+rfel+qmztNERU6QQd2V+mWCzle0kztzrDF9PYpkAPnxYKa1qY7GMs+KTIRGz7Tzo=
X-Gm-Message-State: AOJu0YzbdEgEVEjuf+RBYA0Z3s3PYwlRoGLYDHFXGOecELYmUQ52L8lw
	CGiCIJrRN1smDVG9v6J0ruLqnmR1y8+o9smHDdj1uLY8bXowhUVPSxSxwyDlf/0=
X-Google-Smtp-Source: AGHT+IGC0zIf0EZf9Sh9GDNtGVe6hYpMrO/aUR00MO5y1rs14KedWXXN9Xt4GTFhLqc9c8E6kUqxyw==
X-Received: by 2002:a17:907:724b:b0:a52:571c:3d7b with SMTP id ds11-20020a170907724b00b00a52571c3d7bmr1586579ejc.59.1713085641885;
        Sun, 14 Apr 2024 02:07:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id gf14-20020a170906e20e00b00a51e6222200sm4000307ejb.156.2024.04.14.02.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Apr 2024 02:07:21 -0700 (PDT)
Message-ID: <78b5de01-150e-4537-b6a6-8ca0067a8359@linaro.org>
Date: Sun, 14 Apr 2024 11:07:19 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: arm: sunxi: document Anbernic RG35XX
 handheld gaming device variants
To: Ryan Walklin <ryan@testtoast.com>, Andre Przywara
 <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20240414083347.131724-2-ryan@testtoast.com>
 <20240414083347.131724-3-ryan@testtoast.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240414083347.131724-3-ryan@testtoast.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/04/2024 10:33, Ryan Walklin wrote:
> From: Ryan Walklin <ryan@testtoast.com>
> 
> RG35XX 2024: Base version with Allwinner H700
> RG35XX Plus: Adds Wifi/BT
> RG35XX H: Adds second USB port and analog sticks to -Plus in horizontal
>           altered form factor,
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> index 09d835db6db5..fc10f54561c9 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -56,6 +56,21 @@ properties:
>            - const: anbernic,rg-nano
>            - const: allwinner,sun8i-v3s
>  
> +      - description: Anbernic RG35XX (2024)
> +      - items:
> +          - const: anbernic,rg35xx-2024
> +          - const: allwinner,sun50i-h700
> +
> +      - description: Anbernic RG35XX Plus
> +      - items:
> +          - const: anbernic,rg35xx-plus
> +          - const: allwinner,sun50i-h700
> +
> +      - description: Anbernic RG35XX H
> +      - items:
> +          - const: anbernic,rg35xx-h

Any reason these are not just one enum with three entires?

Best regards,
Krzysztof

