Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89061F0E2A
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Feb 2025 08:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739264136; cv=none; b=kCJqjVELZzTfPf4CPmZ1F7mUuZQacgjH4kkh9wb7f+vu8Qg8Xl60dmG8Qd5s2mU1VRq6KeZthNIYLCBS5JHSpg9jBZx5HoakesL3hfPo8uxEb0gBp2sZrJwiibzvKMrElOKwoHArtf2Lhp6CQyFfc6kXVqUJ5nExi9umueZiD0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739264136; c=relaxed/simple;
	bh=so3608nuzu2Z4wPWCdEL2Kh4q3DiMgLd3JHw50uJwm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VpqI/J65FUIDgzRN8X+JlPo9sAvtkXP5gy1s+Ukpo8NlFuH4iGv0BizO4exfFPIDF6kKYrlz0oilS+gnxWnY1MmQN3IhhcAYDOO+5r9GfZslQt25RKghRqDsUGvU0mJ6L8OF7BvVZhZH/+XGuEuOFUNFTZA2zL/cnF1TwwpgEWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UGl8WskE; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UGl8WskE"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38dd14c99c3so1744037f8f.3
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Feb 2025 00:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739264133; x=1739868933; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2ATS9kH3JOXqCDIar73OnrkF9ilRSB+64NK3pHta400=;
        b=UGl8WskEOILpfIdTm8uRlaN0JsltAQea4unaQK5dUfngK/g2Oo+6dsbsAs6q4nkxyx
         9/WqBQpcRnMAepRN0RIxwp92KZGvjcv0M727l4uvSvOkQV3BWMiK6isyc98bwlrTM6H1
         UURW23DkoRE7+o7doNHidLFzIEaDES1AWulBrwG/D8sBGE6T+TJsRVubwLJ3Qh0Zp7FE
         78A7kaCpnrMtSGOXykjlHxOLnV4JPn64xxrYOhwCMvCl9Po7fLdMdrEifAT9wMm5DJ8D
         9NQNIbl89tD0JaVuE94qMclA9LefLG8U5a4WwFLpAvfHTWYjTw0VLt291LrfWSHcTZYP
         aevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739264133; x=1739868933;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ATS9kH3JOXqCDIar73OnrkF9ilRSB+64NK3pHta400=;
        b=XD7oBWGQ3MOWSDBoeJzGXvPijWlpe0//Kmok4E5CbK8nBjixlRtTNygwmdxKcdypPg
         ijWP5LB6K2D/jaD4Y5LntJxn9/Y19dCTNgRPIdNNdYEf4tEwKuaTkpw/j+eXepuGaXQ5
         0yQdaias03FbCREngX+n9rx2f4DLKnLrOpD9BozBcwywU0xSjb5uF2M2lHypuc6UcLGR
         gzNX/mF4h3LL2Ab2a/UHs+coVQjnurU0/UdjIoPAJC+XIhar3XjsQf1xx1z3Ul0idNdM
         Udf7kXFmi4oYnzATDUvTgcvjwTFFxKWVrmb/pg2EPqtkzXIZ7Q+Xv14X7d2ByiJqwXj5
         1G5w==
X-Forwarded-Encrypted: i=1; AJvYcCVGuvo5pbtNbKiFp25/XujuDZkZzsWzOrmJ5/o0z476tr6dGYhXL+XTgRBlKCroC5n8ReuyuVP2wv6vrA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvtv5cyPFF/GEEa27gPvHEVv39diHvX508qELzJOIIVBiajTP4
	AsqQsDORMgpj8XnD8b9U4Sr6GWeta7eJkrHcnBY7D3wLTBhPQWLpBWxhBnrK9yc=
X-Gm-Gg: ASbGnctzevriJG1qToKRu2biwpawZ03tUyHnYywkGJCY6CT0TYvMBNL36j7wk3Cue4I
	hJjymRU4sGBT4hEfV7Qz5e2CVDSFwJE9VI9dk/X3ybCzBG/PGcAH6hqWrz1wfBui5PIT4HzNiJd
	E7jpaG3+s+YkfOOaab4j7EkdJ53OghzqkkgjKFN/S7cp+R+TSQk7N6qpz645XAttC49oe2gSBNZ
	dklC8bQ/W2hpSXfsur5CUJlb5WAlKJpRyGgZeTtLY+gTXfHnHh9jYM6rHYi4FHcjUFU2BJK9uT3
	k9Q+PNXhOC6HenRk2etLyJgatUrL0Uc0feyTJqNyudlWOonIZyXdGRs=
X-Google-Smtp-Source: AGHT+IGlpUgTYtIiheMDAuizrYUdnfwTiXvy3+Z24hKU84ausw4miBggLrIYHvGUHbl0rw2KWztuoA==
X-Received: by 2002:a05:6000:1865:b0:385:e105:d884 with SMTP id ffacd0b85a97d-38dc9371e85mr13413888f8f.46.1739264132995;
        Tue, 11 Feb 2025 00:55:32 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dd187360asm9452225f8f.43.2025.02.11.00.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 00:55:32 -0800 (PST)
Message-ID: <bdd94f9c-e751-4a16-848c-bb83cf1be569@linaro.org>
Date: Tue, 11 Feb 2025 09:55:31 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: thermal: Correct indentation and style in
 DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20250107131027.246608-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250107131027.246608-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/01/2025 14:10, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied, thanks

   -- D.

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
