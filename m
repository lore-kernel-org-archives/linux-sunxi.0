Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D506C5C5EB
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Feb 2024 16:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707668979; cv=none; b=TxRyZZzCW7FgrPH9KQpA5ja2egy4zhjFcTK/s5/M/oNyY+ynZbcEEn45fkLmAgxJsGulqae+nUDtBfwrzfFRw0hIPWXBtiEY2IF3R2KgddDNh7hWJ0xFn8/j9Fh7JAsX/cD6MNsu8xOLHVY7gfLwD75suqMDRJ23kdd9xaCGokQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707668979; c=relaxed/simple;
	bh=JQFINT1ACXrKhGiU+Vb8AmicyXI0FvnPZWZJM+5yVmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mrS+KpyCQE5y2aUwIwIuhPGSJRJPmbFkIOx8Yn/ZGxegLJNdcMsgfGkUz03GiOaevptunayDpEkg1C9kxGO4DikkMsHswEYvxHbHScbuoSwOmKM/IUDcz2lj66KezwukvAqj+l9TntfcrBAg/wx98cUhMFcB8mYkmKK0bhusXkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZPW+TBeK; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZPW+TBeK"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-410980dfddeso7682295e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 11 Feb 2024 08:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707668976; x=1708273776; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x6Ek3E2TyLbYKHcXoAZ9+3KemEFhPZl2CevDjH4XeHA=;
        b=ZPW+TBeK5JZ/u3fc/PtoewwhhUKjCA5B/M1YsGnOwwXkjtW/ARQnr6xo7Jvn6hmOFK
         +Zk6CXLQf6NN9QsC4zdXZq9v/rfxcF8rzf87135avxRHsORw27jyiSTwJH3uJvsx5xOG
         tlUqFtp+T3/ANIm0BoaIz5UKGwngJ3Y0s0RIKicjUE0aOIhgmIZvusBGgD5VuiNu0vFA
         B801wR2xjqqWi4y5fl+G5VMoKh/W5eJswWOnO/jbwlqi5bTKNwOja3neup3JlP2n5UDU
         dUJSYilWRrKIuGZErEcnXLTMHVWEWf9QBU4R8ybYpwwiFujc/aEdHWcRHFwbv328b/Ue
         MV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707668976; x=1708273776;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x6Ek3E2TyLbYKHcXoAZ9+3KemEFhPZl2CevDjH4XeHA=;
        b=TijTyXH20fQC5BzpNjBkE+2OHcGtYdTQmq2ozGCv/lPppXevMVYOEAVGbSsSWvrSK+
         GiAR0nGnaSssN3FxCyR3V4ezMSqkP8wD2IswOVq+d+kdxQyyd/qYbKfHnFJnAVUARXFB
         1DZy9K7j4/ciR0VYr44K0il/M80ws3JZwZqib/+qKjZNK3icfqDbfK0jPBZShiGOibnu
         trX4kKxnPfgRI1/lwjnNlsod94oWHjNhC+4KBzTjne17Zt2KH1dX1GIekTs0lz7EhFVU
         H9Wq7Y9NXKaUjCAI36qBv10904ihgM/QYOzVMaf68Fvimwi8mxtAMJHuPs3CkZqgMQsG
         lMbA==
X-Forwarded-Encrypted: i=1; AJvYcCVR//tbd3ND2DJkIgIuvpMWKy8Bn17BEn65GkK5ny3wCrnVZ3mdvwewe5yoaEGe2hsTfUeu5PTicuPA/Xb8dYjAkkeSUQ84GmZsR6Y=
X-Gm-Message-State: AOJu0YwaJqLOaWBkbP9LDI8dsjwDp+KViTWOj8MovZf8m8uuUt45aokJ
	zMjheoZ7LlKbqurr2KP6+pAc5kZvaIWPgpM4YB16RcdFJ0v5S0a+iWYTj62OWiA=
X-Google-Smtp-Source: AGHT+IHAbmsyRM4upi92KJ5eBSHIjwARrismq9nRK+rBwUaf7Gw/FoZZ/zLT2lmUAimzAUqbtwovpg==
X-Received: by 2002:adf:a3cb:0:b0:33b:4b08:65d6 with SMTP id m11-20020adfa3cb000000b0033b4b0865d6mr3039099wrb.51.1707668975675;
        Sun, 11 Feb 2024 08:29:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWx8cT1244pCJnZBUapF6hDrZDiYbS7Gm3QeBrz91QzEYUJI05iAgRx+EPXfXHjR5DA+CnNwxBOWo1h7Mxt1ppR4ELBoP/SVB8BF3Tjl2rvQb0XlTLPDqRx1BDfsPxsYq9k5qfBtqmQic9Wg3R9SvTo7T/bjpqVPBRduyDcK5Jda9PnMc0iUMsyxSRiOuWVKgCFG9YzxTpWNr0r+ggeVAF/invbXyDOkCHWWoJ0Mfq6NoGozFpocqyItxGHuCS0UCbU1qR82Hv1XtYvg7KtI67WDMuAuf1LeydzL8EK4/oHPjOmrzdzU4muN6/01gVXdVT+/p58eM7vc3MzlvrisqX6N/arxRzEnuLi1KhspRUeNQo/4sJQSHVZu9/iALUS66oTNY/FO/Pg9qL/hVTQp3BUkw==
Received: from [192.168.1.20] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id l9-20020a05600c1d0900b00410ab50f70fsm2806503wms.15.2024.02.11.08.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Feb 2024 08:29:35 -0800 (PST)
Message-ID: <7ee6df91-76fa-44e8-ab81-fd4b63b58ce9@linaro.org>
Date: Sun, 11 Feb 2024 17:29:32 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: sunxi: Add Sipeed Longan Module
 3H and Longan Pi 3H
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240211081739.395-1-jszhang@kernel.org>
 <20240211081739.395-2-jszhang@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240211081739.395-2-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/02/2024 09:17, Jisheng Zhang wrote:
> Add name & compatible for the Sipeed Longan Module 3H and Longan PI 3H
> board.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> ---

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
Best regards,
Krzysztof

