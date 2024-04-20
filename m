Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69848482CA
	for <linux-sunxi@lists.linux.dev>; Sat, 20 Apr 2024 23:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713654034; cv=none; b=Dmr5cOtf+vkbtrZHvfPP9+/Pxt5mZik6V5fGV5JPOEj1xOeh4UPss6aVgStxyBf66JCJgVGmnE/8NSGo2Fogws0LVRkjevubueZW232gWPB2ouwvmUBoIQjsZ1BgDK6FAAvCVj0ueFf+xMpFv0Iihk5+cZjCuya5fR+KSCBgKG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713654034; c=relaxed/simple;
	bh=4W4kNBK/xrEcrUApwzCM7sLtC45HuF/KUzFjcCmXLt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EQyl6bT5+lcjnktFTpRqqoM94d+5KlTzz1spM1VYYSXiaM33sr+VIsZOIPoHLFOuHo0zbu+BTzSTmtIGUMlMnufYrCbMyS5u5eno1vgNBTasuIUUQ2FzkLw7cYrM6pDVzLwpyzMfWI8vaoofiaXzxm9r6Vb1JaH7E74W1m7A8Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LFagpA3q; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LFagpA3q"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-56e56ee8d5cso4292750a12.2
        for <linux-sunxi@lists.linux.dev>; Sat, 20 Apr 2024 16:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713654030; x=1714258830; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gS/avcdT3uZE+/g4l+u7eNrKfkVrRBnHoxOYygE+RDE=;
        b=LFagpA3qa+b5+k/7KrLrQhfWwX+m4RYb19raFeTtAB7oNlGVgjfP+1x0J5Fy4tSNl4
         FqjGJZJHj/WZdnTY/YP/xZxHjvh8CRQ+9e5ow3rJ1Ckp/dWzAQnif9+8RCUQN6IZ76ev
         PfyPm5mA7Z2aK558YtYLMtvV/jtrRfFdu82LpByM186dmHU9STkWDZvFIEXHJog98ylW
         1sdJUZi6oAuaonu908AUC/of8iW5AzxUoP2q0BUYfkxlL7JVqr0TSGZEI+VOSlD/B6Cm
         Koc27CKnZ+rH0D/fC8z2bJX3/fGuC02QAaT4leatWRe+Ysbyt6tSvHK7yl16FMwYDpEP
         FLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713654030; x=1714258830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gS/avcdT3uZE+/g4l+u7eNrKfkVrRBnHoxOYygE+RDE=;
        b=Im5cFcOQ2fweZPzWllp1PXeK4hBqrfeq2GkB2bzQjXW4Ece/cQy6v76nZ+nlNfmnzY
         rpeThZ8zwoJjy4cy9y1LDgHLugjhbLmDDY4APeQHr//GhH//zxsbCN0XDLzN5Hnqa/7Z
         doJI627YV53ZjNU42Tbm/DGlBarUUSmv8gc+f2Oa0OGnXPpry7yBZNTchORt2BHqo9th
         9fEIoBaWOyKOP7FQ/iFARvgqLUIxHuMcNluW2Mo9k7jbXVbuO8Ow2XnVSZ2ns3ZPAwFT
         soxEonnmOJc4PuIrbPPYP9uTzBUjchn9yFPdUkzBTRrzd6BGLTIc1QwZZyrhzuaI4mgy
         pP0A==
X-Forwarded-Encrypted: i=1; AJvYcCXUNfCSvffdqwJsXyeo6HcVD9qz8TyLvtnMfi8tBf/DVM6+F0hyU96i9m+bxYgd6a79asJa9+Dt+htii39Tyqcg8R4bRYOwk8l3TH8=
X-Gm-Message-State: AOJu0YxN1VHNNh/pvsB2mjhWm+4lgcUQHhDmx20jOX1RcaldEd6N3d0I
	C0Mp3ew6NOazN1HmbQrEzdAwRZmdJGwM2hSw3tlhSzVaYOjdItZMyukB8F6dxl0=
X-Google-Smtp-Source: AGHT+IH4lwqPioLpoIzW6dLhOLlXPP3zMShUOxH0TJXNnW3DIij9PpcqOmEnmKfQrSavTUI2UaMo9Q==
X-Received: by 2002:a50:9ece:0:b0:570:cd6:8ef with SMTP id a72-20020a509ece000000b005700cd608efmr4297896edf.29.1713654029517;
        Sat, 20 Apr 2024 16:00:29 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id eo9-20020a056402530900b00571ef2c1308sm913940edb.12.2024.04.20.16.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 16:00:29 -0700 (PDT)
Message-ID: <9f44c386-4be9-4904-bf67-f0e664773baa@linaro.org>
Date: Sun, 21 Apr 2024 00:00:27 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/26] media: pci: mgb4: Refactor struct resources
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-1-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-1-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/2024 10:47, Ricardo Ribalda wrote:
> The struct resource end field is inclusive not exclusive, this is, the
> size is (end - start) +1.

", this is," doesn't parse on my end

"i.e" => that is, would be more appropriate I think.

"The struct resource end field is inclusive not exclusive of the size" 
which I still think is a confusing statement.

Perhaps something much easier to understand is called for

"The struct resource end field signifies the end address not the 
relative offset from the start field i.e size == (end - start) + 1.

Amend the .end field to specify the end address not the relative size 
from the offset as is currently given."

Other than that, I think its reasonable to assume the mapping != 0 - 
0x100 inclusive.

Please consider updating your commit log and if you do add my

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
