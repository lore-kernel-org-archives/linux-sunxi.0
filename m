Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D786D3BBC8
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Mar 2024 18:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711822309; cv=none; b=F8i3utQ/97C8LspsxDTVHGtUnmQILuOuajtcnIH97K7BopvFoLyPI0ORlpfcxY4/feLEDBRgfYQwV6Dpa90d5w8ProB673B2szyQkVmAsuppxHV4ezY8ioe+ZzJXeztcvF/E1bmrm8XGzbOSDQNSdqu39ncPU/DT8Q/RPpdQSIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711822309; c=relaxed/simple;
	bh=uKmnAYsXvFgZ7Q0n32Ejd9rCgsyZG49+pZPlHoVVOY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZlFFy5tjR/9IiIsMDvaPLG7vlQl6CGEgRSENKrcBqehNfrP7fAVQ6tnFk3nEsls7PodBysCtj2aWOT0qkO/hI/M7zzSfzh05sMxDHzVQ2AQ2xG62S78v6MCOGddJebchJhk536GBeXpQDiTx/21HDPDNDWLtrsJTkBZf7C489lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TgGD5JCr; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TgGD5JCr"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33d90dfe73cso1458769f8f.0
        for <linux-sunxi@lists.linux.dev>; Sat, 30 Mar 2024 11:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711822306; x=1712427106; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G6FfSFT0iQhQsIxQCkilA3RrGtXMgyj7X9sH1RGa6Iw=;
        b=TgGD5JCrXvY3YzYtVbEv7doJSUEqkzVeoUxuRr4z0FSBIn/vvS97THCI+15Dk3SHlc
         dvF9js0HVBz/9osCK+scdI+9r8int6uvYDyzofeRXYwEdrW5TieErZB/kgYfgJ9gb3iW
         PnX29ER8kENMf0HTEBQ9r04OW6HIY/E26AQeB0ie0oO1dZBK6+RdxcUzw68v4NmKzXOH
         Hu1uyDoazN1VaMQlBcdNL5w9keqU6LcJxpzIfcyc52MXcarFTI9Vkob9DETj3tevg5gr
         R4fUfQ8wSv4h3opn7FjTI3h8Z9Cpksh8J5UTGSwIytuLaHUA4x+V43RSq/oGRNKlvniH
         ereQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711822306; x=1712427106;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6FfSFT0iQhQsIxQCkilA3RrGtXMgyj7X9sH1RGa6Iw=;
        b=MzPxjdY8a4zKmm99XT97FiphGN9vStwlv/1wIOl1l62FSVM6aJKIDRixZBVIhSRDQA
         sApZBPAEvk32A1AjQlZjp35nCwyz2ivLgdUnwGvJ5T395/C4hLGIB1lXdizdysh8vdec
         meVm3cF8yRo9VzPw/o7G4YKOcALKBFvZtLi5o3evy7pifZ/0wtsEBJLHardnw0Bdwna1
         JzPLCI369yqcLLt+SJKh0rFPlF2wZEHP/ncSIsoBW/5+tlzyruyipI+ipkrZr9Xy8IIb
         f6xWzxSSiIhzDG5mzLWRc6LX/qTPq0uef1acp5zpXMy+sz1E+JpQngLf1gYNZyClLKRR
         E7jg==
X-Forwarded-Encrypted: i=1; AJvYcCWTw47YPKyxszcbD4GWBsokGbtB5GYxAgPQQxSpDwIVlcamD3gmh56Az55j/KKmy2QrIRektPRPxa9OuTMUmC44k1I53S9rKrwI3OM=
X-Gm-Message-State: AOJu0YxUB44Mu04htt89mPrquScXyswSrbHLzsk59JOj5Yu6FR9OHGn1
	7K2p4+SuU179DRqgXsqyIUfmlD4Xlq9LzLDqmuQOcEEiDW//3obGV8r4euiwdco=
X-Google-Smtp-Source: AGHT+IHGNzzOcrsjxFkI3C0f3COW5wlxqzJ99dai1JoJ7cSUkHlMboIodgKoDG6p2Ld/MTdnLd8y1w==
X-Received: by 2002:a5d:5281:0:b0:33d:754c:8daf with SMTP id c1-20020a5d5281000000b0033d754c8dafmr3980386wrv.10.1711822306407;
        Sat, 30 Mar 2024 11:11:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id dp18-20020a0560000c9200b00341de138a2esm6976538wrb.94.2024.03.30.11.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Mar 2024 11:11:45 -0700 (PDT)
Message-ID: <91d398c5-c564-4889-a45a-fcf8d805bde8@linaro.org>
Date: Sat, 30 Mar 2024 19:11:44 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: sunxi: document Tanix TX1 name
To: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20240330013243.17943-1-andre.przywara@arm.com>
 <20240330013243.17943-2-andre.przywara@arm.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240330013243.17943-2-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/03/2024 02:32, Andre Przywara wrote:
> The Tanix TX1 is a tiny TV box with the Allwinner H313 SoC, a lower bin
> version of the Allwinner H616. It comes with no SD card slot or Ethernet
> port.
> 
> Add the board/SoC compatible string pair to the list of known boards.
> Since the H313 does not look different from a software point of view,
> we keep the H616 compatible string.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

