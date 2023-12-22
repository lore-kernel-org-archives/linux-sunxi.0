Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC94C147
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Dec 2023 08:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KXPrxgOy"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5537dd673e5so1272614a12.0
        for <linux-sunxi@lists.linux.dev>; Fri, 22 Dec 2023 00:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703232587; x=1703837387; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d+0hhOkLGWCOAXqrUgauiqukaKyikGKK1dOU0/hvpGw=;
        b=KXPrxgOyLD3xeg5OS4DGE4XeJpIUZ/AhvUV46EttoL5qJSy6zwQQbackstCUhxqesy
         O7fpD96iG/xEqagooDkgDD+gRC9z0caRFbO1uSSw7MKDwNgk//n8QC1IKaChF7kkA2ZO
         HZ9W5NHXPvHMd+iw3zlTRSNtN0HysWTX2J7OeTHZTlPJrCciRnHNdYWe004mlbGUgb9/
         /GoKRl/HQG28RjrzRsTT3G17fQXo4qY7J/m4lnvgD1aKp24vG02dSQ8pJ9+Upy5h8NOt
         N02R3zfIcJ4e5Fsz97AubsIW2XCJCcLn71y5a/VGlloev1sZGGxXsuUQKYPfUQGrmp0Z
         BBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703232587; x=1703837387;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d+0hhOkLGWCOAXqrUgauiqukaKyikGKK1dOU0/hvpGw=;
        b=DuJbUBVXO0SESXvsMbgdR61hFrSvrpBRnuy7tVdMngVQOzWXxnxzGdfmFRjCUGdlRB
         4cLEpLnuT9KiuE2xj/ETkbSHj+OqJIOH0jv6RVpfzl089VSS7pXlQmuBvhBKt/MauRgA
         SEGapPzgZy1i24WaKliv9pTmLCH7ZovmFojVIL5Qnq/Pjq/TmmzOS3jFSK/f2QigRUaU
         wYDGiJiV2BIyZ82GNUFOPGVMCjXyU82fS9cPzimNHVkYrwUKQp2QnkSW8CTiVPcJqbsd
         dmIkl8cgu91n1WCwI7pR27K8UIVrVDyVhA8kmIkc61aL6ChTSbHENcixwzBPiMPccGwE
         kiWA==
X-Gm-Message-State: AOJu0YybGy1VP4QtlkdRCCjsvOYsq75jgQ6/mujpDLC3Tl13YUq61FOU
	Ags8i5oXFRrBuLONcQOQpq8uPP/i2aeHRQ==
X-Google-Smtp-Source: AGHT+IHI4TTh5Mybs9y1/4VZnQyAMOH/Lml89eaR2CA6X8bcxlBZ/fa+9NrmHxrc5d8g4pjUVQfZ7A==
X-Received: by 2002:a50:a41e:0:b0:552:1ca9:3d51 with SMTP id u30-20020a50a41e000000b005521ca93d51mr463991edb.15.1703232586604;
        Fri, 22 Dec 2023 00:09:46 -0800 (PST)
Received: from [192.168.0.22] ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id df23-20020a05640230b700b00553533738f0sm2270783edb.57.2023.12.22.00.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Dec 2023 00:09:46 -0800 (PST)
Message-ID: <82cae2be-edab-4b2d-8b2d-bd823b58eeb8@linaro.org>
Date: Fri, 22 Dec 2023 09:09:44 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: sunxi: sort alphabetically
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Maxime Ripard <mripard@kernel.org>
References: <20231221140614.639697-1-andre.przywara@arm.com>
 <ab8e7d68-c09c-47ff-9f31-08b073387403@linaro.org>
 <20231221150714.53d40ea3@donnerap.manchester.arm.com>
 <6721cb2f-4498-4d20-9059-257846005905@linaro.org>
 <20231221162907.1b609235@donnerap.manchester.arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231221162907.1b609235@donnerap.manchester.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/12/2023 17:29, Andre Przywara wrote:
>>> Shall I add a comment at the top to note the order?  
>>
>> Some files like this are ordered by compatible, some by class or family
>> of devices, so first you need to be sure there is no existing order.
> 
> That's what I did, of course:
> - there is no order in the compatible strings, not in the most specific
> name, nor in the fallback names
> - new boards have always been added somewhere in the middle, never at the
> end, so it's not "oldest boards first"
> - the SoCs used in the boards are all over the place, so it's not sorted
> by SoC
> - I see no rhyme or reason in the board types: we have tablets, devboards,
> TV boxes all mixed up happily.
> 
> But: from the 197 listed boards, a movement of 13 boards, often by just one
> position, makes the list ordered by description.
> 
> So I assumed this was the intention, and fixed the list accordingly. Happy
> to stand corrected if the maintainers have a better idea.

With short comment at the top about sorting:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

