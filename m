Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8E416E863
	for <linux-sunxi@lists.linux.dev>; Sat,  4 Jan 2025 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735983305; cv=none; b=mn3bL46METxbGfQBV6J54rZRM7Xzwx6ED5emMQK9DKByBwB+58/ZRVLt3PGEwzDlUfKDR4re4By76RR6jCjdbqtSWCHkqngvJzR48Laio8Bp99Ayx00LYOI2d9S0LZbMaNiOTApHSajM3PK2QUXqI1VXKoCvDr7qHPfEKLpu78Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735983305; c=relaxed/simple;
	bh=9DwfVlPZKedN44pI/T1zeAy34WnuQkbQQOxuWVdvv6Y=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PKdV9kKZDZqEj3NCS7jxTEwlmFX4oupaZdYbspB863F20RrT8Kt7LUoy7Ajbom58MIHWY7nhbH4Tck94iT5wY2uX3eI0/+EguBbOrdOYLZw4+v77y2WZNEwCmhLNpzODEnaq/Y99SM9e1VEisvgJLehu+BA1pqvvcXesd0RGwX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yp/sWHN7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yp/sWHN7"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361aa6e517so20167235e9.2
        for <linux-sunxi@lists.linux.dev>; Sat, 04 Jan 2025 01:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735983302; x=1736588102; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tfwQCCBu63aZTVhOZ4c/EiZehZjukgRMOTrP7C2cC/8=;
        b=yp/sWHN7EqVEXqbSWXRw3Ve8atF2iQtoLlo9txU+gi4Y1gAdduTdtUnr0SUjWfwXpA
         15HRc0Wgrnz6a+LHTpJpe5WB6xgTryZlHe4jWcULCZ7xqgZnDHcA19DzAulbq8y/rLW4
         xIy/gPa3TsVf4bUv9PRCen+GGqwQxb90PN3+LLT0NwkVB2XaJVvZxJP15oGRwFlMPG3h
         ewdkcPzmMw0FDVUfPxqggpNdnOV3O7ADfw90AQAZbKpA0mA/tnrv8AH8ruRW580AYvgC
         SJ7B0AQOmrqM0XrQLguCRSD3/SGIF4yUPleqRv9X6p11Y2pEDL7uSIi7YJayUqVjvRJT
         Zadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735983302; x=1736588102;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfwQCCBu63aZTVhOZ4c/EiZehZjukgRMOTrP7C2cC/8=;
        b=EI3qb/ncFDsHjulXphRQhaESOG+Voe6iu01gnLzvi/dYRmO27RpBfwG4F+bOfrfVZH
         FeX88a+L/NX2oF6KK++DPSbbuRCKfa4ScSqk6bN5s24cDFP8xannQsAS6ZMv++saAOqi
         2l4RRYzx7a92ApEe0jXr0HdvDNjLXWrJgbDXlwOLNjFTlaba3CL64S6D0FoSM3U4kSDW
         ahr84rDdTGc87zQw23x+tmA2wUact6FQTjzr0dvCI0HVpJRg2B8FAtfICVD9AzqVek0x
         qWMJzpfwu8AlE6PSYi2xJwxuiTmwS7vjTvf5btF0Lc7VoHiZFPpo3prgrxD70taShSbV
         Xjiw==
X-Forwarded-Encrypted: i=1; AJvYcCWgFsjRIxF0Y7qeIhmXSiPPmANzqrUuuGRriiYVF5WwoYcX/5f8OKhLJEIR2cKQFFjmRIi/g7LTopad9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxuHyRhgVHJAQUvFM8HvhWj/1m4/snvUvxA7JWa8EVqa3+csZTw
	/1Bqufs8Is68ybxishePyFrHprnBn0AymHEk70A7ST/6w9yyMS+36Jl7Zoc/hhY=
X-Gm-Gg: ASbGnctTe4OiIFP1tj8iTzxn5xt9X/vx/NtGB3cshiyf6xoQeF/u/05DtpZoE/csFHd
	qiOIOkUSH37nG5plX9oMqb8KrfGLUVkitkOFEFqZA7f7vWkF6X6m62SVlp9b2hyqDhgzM9v4Z7K
	Z3StcOA4b7ARKKWJndf0eOReFlvC94zYY63OXxUOslQ7UOrLWVh4kzRYvIUGW5g9c6xqQ2sozMp
	yFrTts3tQJOblGxb3eFRhoDtRXYZ+7zat9+xBbI7Fjg3gM4HRvkg5GRRMIgnlxyW+OD/uz2yvaF
X-Google-Smtp-Source: AGHT+IG3FGlzh0yaJot++IsAzOuMcup0/rVdO0ni0icMoCmRYddvSjFlUUcahxyyoJSviClT6wmdLA==
X-Received: by 2002:a05:600c:3ba8:b0:430:52ec:1e2a with SMTP id 5b1f17b1804b1-43668b8fd2amr168430765e9.7.1735983301759;
        Sat, 04 Jan 2025 01:35:01 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436612899f0sm508109245e9.38.2025.01.04.01.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2025 01:35:01 -0800 (PST)
Message-ID: <d34f1e9f-7a27-4a72-b706-12e3175432ac@linaro.org>
Date: Sat, 4 Jan 2025 10:34:59 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add NetCube Systems
 Austria name
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard
 <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250103204523.3779-1-lukas.schmid@netcube.li>
 <20250103204523.3779-2-lukas.schmid@netcube.li>
 <pvbpqlejn6r7yjzufdmialyvjlmitusltb3ljhwstxbtoglf6q@7tvjz6neolnp>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <pvbpqlejn6r7yjzufdmialyvjlmitusltb3ljhwstxbtoglf6q@7tvjz6neolnp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/01/2025 10:30, Krzysztof Kozlowski wrote:
> On Fri, Jan 03, 2025 at 08:45:17PM +0000, Lukas Schmid wrote:
>> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> 
> 
> Repeating again one of my comments:
> 
> Please run scripts/checkpatch.pl and fix reported warnings. After that,
> run also 'scripts/checkpatch.pl --strict' and (probably) fix more
> warnings. Some warnings can be ignored, especially from --strict run,
> but the code here looks like it needs a fix. Feel free to get in touch
> if the warning is not clear.
> 
> Please implement all comments.

My bad, I did not write that hint earlier.

Anyway, your patchset - all four patches - has multiple issues so you
need to fix all of them before posting next version.

Best regards,
Krzysztof

