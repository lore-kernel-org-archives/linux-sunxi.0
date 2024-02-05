Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DBC1170E
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Feb 2024 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707122706; cv=none; b=s5rqf3TLvG3TYdxEJn/SU0LpMY+wrqWyGrd6ath7g9REk+qyinHwCvIWvqfSI6p6WkpbYdA4rSdkFaLpCe7bA1jUdLAuPbNX7RU20sIAVCtXNCS4Z2ALRVU/dXt38/srqJl7hSM8LGU0K/E9Fyr5zlp/uGhqoF/Rkm0r3M0fi58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707122706; c=relaxed/simple;
	bh=Q/Maet1YgsnNyluiMowa5c46mD2dQXqATv+B29+jmJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bJy5dt3NSpy8S+qyEaqpp/s+ztZttiHlR0hQcC6uWZhwV6ueqJoS7EySSp5GWgfzZbqs2rWgRTDlSUxThE/m2tW+ZIsyJF9Kd75fmbaANwXjMELULua/Ge9DTJjSRQ/EBMfAomj0cRHwn/Fjv0JGzBMXO/JGdn+TZsemSznQ5Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I3HwZ8WC; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I3HwZ8WC"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a370e63835cso302668866b.1
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Feb 2024 00:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707122702; x=1707727502; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oaE/SyebJ6qY+Zm3XiqHO24prODZDnnO/CvH4nmaGPg=;
        b=I3HwZ8WCQMlDNBLNxSWdSBiKES+WphHaackv8g+IghWE30oY5Vx1ha039nh6cwh8zv
         YDFhqW2xo5EidcU6q67YXc5F9XKrPJ0VymLc3UvH0B49ki/zldAEIGosWaimshpPc8hd
         eK8yxecGJDDDX1Rawerz0I6N09Ldhtxh6p/R/PIQ7ie91UZlkv2KNp/hRwqDKhoQRAv9
         TmS0M0tWdfCtVwZUMGWX2Y3caQDhOvyMDFAR/b3oWpWQuG5bTSj2SD+JuedLUJpOBNYP
         i7O+jwsUrtnJUm6aDAQx5czS5GDq2e3hdOnKw6rOuhhgl1WJqACMZRWB2dgPyMovRv98
         T2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707122702; x=1707727502;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oaE/SyebJ6qY+Zm3XiqHO24prODZDnnO/CvH4nmaGPg=;
        b=spYK4usXaFsc/M5tJoN23qQUrXsa4EaJwjZ2cQAPByB/h0iDlTxYcFZlvyqDiKcWSm
         gNLFrBb5V+6CeQFDtD1pR+OR6ANpNejfiNIY5XGCWB++OiIFUwk6KipWBWPK60ULQioy
         N+q4UaL98KIPYy5I2XtviFO1fxTH+NA2r8++9+49U3DGo7D3ge+8RbNUz+oPR4B9Qivg
         HAgBM1ApHQ6y8r4tSWfWubIC0SbGtFBvcYV/PjLx8SME7Rw2DBm5zwyF0GT++0h1xM3G
         K79Rov2RYkKlYLsaBODhxSHE9+FpdGUTo9GhGqW0skAAhrX4fdUCKlQK9Obb56AsXpan
         gYcQ==
X-Gm-Message-State: AOJu0Yy3Vrm5WOWF6A0XgPEW17246ZlfI9BmBnVCbBlS8RXuC3P0KnEi
	qByDtL6aTeOGAUcIw4gib5uEThWBru2tkSlLFgO14TQWK+kgPtPyXuR8WEwvoxo=
X-Google-Smtp-Source: AGHT+IHx5oqaGANeLVzoflywTT09TGy3VNeQzcSrDwcvLPVWpykVQGsQwTQUtQ3haDVPpI+NZvCBZQ==
X-Received: by 2002:a17:906:2002:b0:a37:b4a9:3d53 with SMTP id 2-20020a170906200200b00a37b4a93d53mr1316651ejo.2.1707122702755;
        Mon, 05 Feb 2024 00:45:02 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU+T5CLQ/sw40vwFqGlj4OyHLK+MZrAjOdUT5TneDknKXXO3nu18+AcvuWFXcTX9RCEldBW0q5I2eMFDui+fIDCDg2BYUTrtqpfeAJAcZx7ANTZUjoOgMyqpXCvekMlxVfwNek1e+xeeO8JNzcfvvAE8wO/hPIZvQlxESDABFVdCEU0xtJ78i+4RXvKd8JfIGvymhRQq9kFzAlrRLtc6BluzYkIaM5Zv4/96p8rBpKCMGQcLYXsljqwub5DN+JqXfCtmYwVNqMiDKsZCFZ8zxNC5Q+IG3X6jxNdB/WbIMpWqB5Y13m3rDPtbah5Bwm8mBnwwKuESehSNovH8vGAujIwDgGFGXYRBPArNxPOSboMjn2n
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id vg11-20020a170907d30b00b00a37669280d1sm2350990ejc.141.2024.02.05.00.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 00:45:02 -0800 (PST)
Message-ID: <17232561-5f1a-41fc-9002-e7482b0fdee0@linaro.org>
Date: Mon, 5 Feb 2024 09:45:01 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: document Remix Mini PC name
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Nick Alilovic <nickalilovic@gmail.com>
References: <20240204094404.149776-1-andre.przywara@arm.com>
 <20240204094404.149776-3-andre.przywara@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240204094404.149776-3-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/02/2024 10:44, Andre Przywara wrote:
> The Jide Remix Mini PC is a mini computer that ships with the Remix OS
> Android based system. The SoC is an Allwinner H64, which is very close,
> if not identical to the Allwinner A64.
> 
> Add the board/SoC compatible string pair to the list of known boards.
> There are some drivers that look explicitly for the A64 compatible name,
> so retain this name to increase compatibility.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

