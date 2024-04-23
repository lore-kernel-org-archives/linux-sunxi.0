Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B2213D294
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Apr 2024 16:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713890578; cv=none; b=Tg8EIAwZhNeSr2aJ4bu4xY3Dikx+PjJ8ohVTVLr9VSgdpYPUgqveM2TT/QdfCQmBSbMnTpes5zqDJ9+SvhF0yWX+V9/i2SZkgC6T+yAvtHMtJlqyeIrj9x3rrzeO/He3s+/JulYD6r3cbHlnKqruQbtQt39WRs7JOGGka3Tmc4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713890578; c=relaxed/simple;
	bh=GpHmjh1oP5OnIlmRru0FaAZCq+BYGXsln5CRJl5tfWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q7TWDSJgRgPHIkw5lprw1r9/6RS6wEEEo3GdKfT5uocXALY3hcvrHNQxvJN6ugpMu7uMAkA8Dg2iNqu3uroKdPqxmdcb+Iwk5qjRZ8RC85eh5lUTxV8ZsSM+/J6pLmJ1n7T8jBSpol4z13QEBlXjWt9ZoDxJ96CsklM+w9kqKuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZGHSCp2s; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZGHSCp2s"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41a7820620dso16144665e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Apr 2024 09:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713890575; x=1714495375; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AAjd9LkEDNuVK7j7GhyFYBnO65hiE7cXAXMhivu0jgk=;
        b=ZGHSCp2sTp3wlv3qYvfyqwaZp5vTZVpG+IsZ840rGUppOuKDChlcBR89MiCIggRdMx
         pcdT3ncFGAiGh2XRiIT79WEQIqfOPs68dID4X/we40S7yFXF4aBwQ4EJ/4HAExrlTOV0
         jHsWM4okV6CdNzUm4HygfGKkMRYPE5iShfz9bxvA8QNXKUgWp8DN1T76NbpHhLaKATKA
         zwI/z9EdfXLPFIQRRAzPhYit9oBhwI3sHOj/9na2pvLUAv7q94JsN9JHmrFIZpiCBjUj
         DLctnsJ6LSLgnezu9MpDdLLyvqLfa8Ogd7DTrNWC3BGXx2+U0UTjnoi2ktG1DF54dkcb
         8dBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713890575; x=1714495375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AAjd9LkEDNuVK7j7GhyFYBnO65hiE7cXAXMhivu0jgk=;
        b=qtsJHk1raHcYtYWoc7qvhKxRXuuDtktyqOCYaxprVrQzT+16Kdj/7pl5NZ5QMthF4X
         199vzYTtVq188/gUPHw4ARo0ysq3rd5nYd2KaldQeCYr6pc09r7b+rwy6oxOS70vedH4
         donzoB/zvbL6Cz8zm4qX+IEAgXr9uLvbNUXH4tg67vZTKvnYjntJOf2HY0JcIhna8xcQ
         vr33Tet2+wX7ydaDtUNJHzupiVPw136rwZ9PIpSZ9KcsSUt7lDY+DUNWMjuf3YOkmq0d
         md+1ApFctpq+oN31yLAvhEYTlmQs/M5WBVwzzrNhOLeeF9rJo43L4i0cU+CCCa4vo/jA
         +d5w==
X-Forwarded-Encrypted: i=1; AJvYcCVazw57baWbPwKpYgJG8u8wq5UDopgeUmxN/GU35Oh9FpdrBiN+xzyJL2fqc/hEpbYJ/aZowD9utQWeef95d3MqKAjE8MmhJ9bE0N8=
X-Gm-Message-State: AOJu0YwFDiK0pW/f9T9F0khZnq1QHkMbQDk1BV2f/M/gd7a6mGPM0Gq/
	pkMdUDzSp91CkFOn2QPpVylnYNEysBWFwvD+Gx0mVF/KxjZlAWzgV7Gvc5zv60s=
X-Google-Smtp-Source: AGHT+IFrxYPbNd0JIn8yeAWouLUX4KO2HR4fWg0b0VJjkA0zy4qA+fxtUoj+497CZ/NN5m4uB+meNA==
X-Received: by 2002:a05:600c:1c9e:b0:418:a5fc:5a5b with SMTP id k30-20020a05600c1c9e00b00418a5fc5a5bmr10146720wms.36.1713890575406;
        Tue, 23 Apr 2024 09:42:55 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id jg1-20020a05600ca00100b004183e983d97sm20619705wmb.39.2024.04.23.09.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 09:42:54 -0700 (PDT)
Message-ID: <3f5c46bc-6fe8-45a4-8929-7b93b276478f@linaro.org>
Date: Tue, 23 Apr 2024 17:42:53 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/35] media: stk1160: Use min macro
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dmitry Osipenko <digetx@gmail.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-19-477afb23728b@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240415-fix-cocci-v1-19-477afb23728b@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/04/2024 20:34, Ricardo Ribalda wrote:
> Simplifies the code.
> 
> Found by cocci:
> drivers/media/usb/stk1160/stk1160-video.c:133:12-13: WARNING opportunity for min()
> drivers/media/usb/stk1160/stk1160-video.c:176:13-14: WARNING opportunity for min()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Show the commit log some love, then add

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

For patches 16 through 19.

---
bod

