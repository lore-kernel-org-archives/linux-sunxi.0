Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D34D1CD38
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Mar 2024 14:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710687496; cv=none; b=bpPEkkWMtn4wZATrY/MxFPewJjZDIRs+LpAC7LDCPbPIImU+5xg07X+OZ0ZgbGqiYP4B1+oRDSiLbjR6Kevps+agPoA6+tFD6nVWNuOLHk0gN/9hmKJ7DSVnIKgIPrQhHehHr5BJZ3QV7GV55c1vqk7LEIhXziDqgNffwv//eE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710687496; c=relaxed/simple;
	bh=UgGhzEZu4Xgd68c2IKB35yAhOh2c/UdIWt3MJyHBz3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OchDJVHiV57n1otjUC+OHoLMaYxmcADrS6nROLLYI48I5rIC6v166I2Z9+NgPGGXGGU8VcXqu7uePRzbvjHRLSxYy9BZN+DrteH8ee19X/fSMmJNaZe9zeEi3TirFlIe+RI0iB4meNvi+UuwkrDXNqIFzFTxXfI8HSKbr4V9hcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y4Zez9v3; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y4Zez9v3"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-513dc9d6938so2277787e87.2
        for <linux-sunxi@lists.linux.dev>; Sun, 17 Mar 2024 07:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710687493; x=1711292293; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mhg05blnTAWhLeJk88QGMzjv8XZZX7WOA0pJtI0X8GM=;
        b=Y4Zez9v3H5Y8FaavcbaGwnpbzNYPMi9YEEaDEJVYtNtkuh2L0F/PA0E6DdKv/svvtl
         Bd379DbSh7MYKgPJhKhn3VB0ti7pCtChuzuIhINygV+u8OzM2UzmCq1rG9uxKCAHbhFM
         295LRLSLk3bll1zjjJdNDe42zq4QYdBC+scSZf+9tiOIW4+rTvgnjAGu5o0r254NgFae
         LW9MqdZvPBSm8FeSACPpAYagpejcBQ3YVLMcu4GjFBq9XngTUSM0OOTTyrE+nPjxrtmu
         10Q2z/IGQ6y8tGGrRvm+3+6DOkFIbitT94AbRkA+bv274AI3FvdDBO8YReXV1fEBIxsE
         v65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710687493; x=1711292293;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mhg05blnTAWhLeJk88QGMzjv8XZZX7WOA0pJtI0X8GM=;
        b=m/h274ZSpZp3KTeUMxWRbdFcnOlzN882DYc0zUiX2o0lAvlRfPyCfgeZMNsQKhUpx0
         gYYEqELdD14zAyN3Wg1o+3bppSlkEtmt058Zg9N+WD6Fnw5riX2XeWBEWydp91FTFlZb
         qXK4JxnGmkJ8oQv2p5LKuxz9NHEaZ/iRlhY7MI1XeG6JtnCbOzOUidB/Rum041b1+Ha6
         D4ftW09BbR2EsWjyBkatEKK4E2hyAcJ28CpuBbcTBMCDV4uX7JeNS0WmROgZdl/guYDk
         h5fu0GW3DL0Lz7UPtVf/Vjj+69ApDjFaGJfLtjnkUT1mzy+AHscUnV9CBAoTCAct4Udm
         Yshw==
X-Forwarded-Encrypted: i=1; AJvYcCWEslotmBsaPz+YG6VfUTfT7Pv2C6T4yzXoMgC+WU8tQZbnmJhA7Y9p+q+8yJQZarfwnWdPmSZXtvLAEDwdqcIp+9f7CrEhNcW2Kwg=
X-Gm-Message-State: AOJu0YwuqbwfJLsjmrNIVZ+2v9ORoO++wXkPZJeJN2q30wpMx5OC2lMj
	W+6A4kQwbWGX9U2WHpPO/aa2jvWBSo9J4cXbR2Icp/IQg6tDTPmalp7v9KLF/Yc=
X-Google-Smtp-Source: AGHT+IFtAznvhJdMCr6xNsbWBrPThEzQn3YacvBzzvhrGYIBupi1q7yy+e9Fxc3MjIz4QZ2kZexpWQ==
X-Received: by 2002:a05:6512:538:b0:513:a920:aa77 with SMTP id o24-20020a056512053800b00513a920aa77mr6390665lfc.16.1710687493577;
        Sun, 17 Mar 2024 07:58:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id h13-20020a19ca4d000000b00513b324cc32sm1302471lfj.268.2024.03.17.07.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Mar 2024 07:58:13 -0700 (PDT)
Message-ID: <9adc9f37-150e-41bd-a327-ee3ec820c451@linaro.org>
Date: Sun, 17 Mar 2024 15:58:11 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: sunxi: add T95 AXP313
Content-Language: en-US
To: Kamil Kasperski <ressetkk@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20240317-add-t95-axp313-support-v2-0-e38032811758@gmail.com>
 <20240317-add-t95-axp313-support-v2-2-e38032811758@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240317-add-t95-axp313-support-v2-2-e38032811758@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/03/2024 02:34, Kamil Kasperski wrote:
> Add T95 AXP313 TV Box variant to dt-bindings.
> 
> Signed-off-by: Kamil Kasperski <ressetkk@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

