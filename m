Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7436136E26
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Apr 2024 12:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713876399; cv=none; b=HhvYJzJIvvXdqjgmDNH7DdK1njQjYdzQyZR1dAmledsxUFv3/kqMAwLZmlfBrk1iYWKqK78u9ey+QOVcjGV0mPnFUbtpLcK5y/lb2TI+49llpqAwhiprKGy8rITnUjLSqovXTGsyBFncUy1zsfy98Vbdx5IzmdEMcmfK3Hr3HG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713876399; c=relaxed/simple;
	bh=UXbyOuSKUk6g1FCuzFbmBH4NJztxq0P/VMUY9kPJrvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r3shYfDUgK6yLrwGDUViXTg4xIKnN5qyixMUstrjLxfiDcDPwKH7vzIAazef81v5Pp/CndL9+GRl4Lh7rmjDVi3qAgn9MXmto52xtQxXxbdvOmzZmR4S/Sypyyzs2pVFf4M7HqtgY0jJjOgJO5YFmJoIXa5psMoN+k1lgNifMgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pr4uZtXC; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pr4uZtXC"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-34782453ffdso5668185f8f.1
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Apr 2024 05:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713876396; x=1714481196; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SnPvo8X71/HjmVfrFSADYDRaBhD7wOKAzatHqFXk968=;
        b=pr4uZtXCYRhKH1kMBlizjdxH3heKWTWZuFBSXbfpmRQjMF8r6PhzuhqKjlgc6jA1TS
         QOka9p7ARh6N/nqhvwQGmVntPFS0bnR89QFDcDVoW0D6i6YWwL34i0YEesQ+T/6fRUU+
         qdaP9WAcsefimMXmHmzWSP7gnsdAz7pK0vjC5VfE9r95tbaVNQo7g5AyHuzb3wEbgttW
         IWZwQW9ZoVz6+W5Tb37DeqLOJ/jlQiKFohQQksAxnaEhZHE8dA4Pc+2sPzvD6aXkv33Y
         bCSTH9MhDUhhit7sC7BS+Kuq32jNOT2ht5ONTsNLEZ38Ri0DnEYO+DgkieGu26ER95l4
         FKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876396; x=1714481196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SnPvo8X71/HjmVfrFSADYDRaBhD7wOKAzatHqFXk968=;
        b=VPQJ8guokr4Wvou6Y+rmXq06gKg3zJf6VfodF3MmhTIV9L9H0cSqU6+wU93DkNO3uR
         g4mV8e9q95GjQEMt60twmLl88E7c8n4i/wnQz4UFratW88p6s0hv81NaDP/bc48QDRcH
         sV7RX+wSiKYyQt6Skub38ti/MmHck7pnvea0s3EowUVsIaxI7i9MyH82gju8zqsYQbWE
         uwlTLbxLx2yDdaX97UkGfQDwSnQQU9SBFtpKx1i+mwnp1KD3zXaHRSb+QBN6n1Hujt5A
         +4NDG9agi0cCFZOevF2K9TBm7R+i0au7eQaaP11NfqGulEStDBnJfsDjOZESgKKoTdkk
         sVSg==
X-Forwarded-Encrypted: i=1; AJvYcCWUq0sW2pljpwGgprguHQy2d1gIO0LZBHzU7XJpkbCksN9ItT/+LkQ0JqRsBT3hYURmlphHns5UwY4fj9nMhnnED1UN+WxwNZNWLFg=
X-Gm-Message-State: AOJu0Yzu/O+W4KuTnbVEYZFayUvNpOV98d4UfnIALlOC42hwYaDkxPYY
	gv/6CoWgHPzCtURvkKZ81kmXAlU/3ZJ4juJ31Pf9I2X4BbNGRRgX2ug1TyN7/Y8=
X-Google-Smtp-Source: AGHT+IG+1vx5mJkN+16nkw6DrmjKX/bCAbSI7iHWCeWcx9NCAuHfmO/i6PUYzl4PV0Sl6Y/Ow1sbhA==
X-Received: by 2002:adf:b197:0:b0:349:f83f:9ebf with SMTP id q23-20020adfb197000000b00349f83f9ebfmr11081490wra.5.1713876396189;
        Tue, 23 Apr 2024 05:46:36 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id y7-20020a5d6207000000b00346f9071405sm14531796wru.21.2024.04.23.05.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 05:46:35 -0700 (PDT)
Message-ID: <44d6ab8c-3810-46ac-8e54-c125b5c29199@linaro.org>
Date: Tue, 23 Apr 2024 13:46:33 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/35] media: platform: mtk-mdp3: Use refcount_t for
 job_count
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
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
 <20240415-fix-cocci-v1-12-477afb23728b@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240415-fix-cocci-v1-12-477afb23728b@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/04/2024 20:34, Ricardo Ribalda wrote:
> Use an API that resembles more the actual use of job_count.
> 
> Found by cocci:
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:527:5-24: WARNING: atomic_dec_and_test variation before object free at line 541.
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:578:6-25: WARNING: atomic_dec_and_test variation before object free at line 581.

Same comment here as per the previous patch.

You should explain in terms of the memory ordering that refcount_t gives 
so that the intention of the WARNING and the API change is well 
communicated.

---
bod

