Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF4F3074AA
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Nov 2025 11:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762772837; cv=none; b=MFV4s3u4P4DnMqkbh3UGQm8M5Wmz3JG1XiRKNOkr874jvI8G7T58U0y4NmTYTy5Bm/enU1rAa2MeYAhlXfr8mwvGx3JjsdTQi7HbCajU2FCQdlS3AlRNdYJkWre6BK62JXVYVxNbM4SxnEYqu1eIEvMi5V6K1fw3c6YBjqrX+Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762772837; c=relaxed/simple;
	bh=y9Rc2TSg2Orx+cZa9j2QdmCSgqy1wVj5vvqljCG9AMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2Uifnwfu8w0zpgR+0VNu1PrZjz0uEIU6h9X4MwtXNW9voo+qEdhOARQraARidV18R8DHlBqjfcelUnqcyjR+a+wHnHZP/KwLHNv4NwFL6GEkJDI++m7YyyCRwvEIZ/KATTR8gvKhJ5isW1HBou6pUgfq7h441kBQghIfaZqZcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oerGLGHO; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oerGLGHO"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7a4c202a30aso2216309b3a.2
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Nov 2025 03:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772834; x=1763377634; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TZrYqw2/O2UZmuuLXYkU5bIjhuFDnuqQ3/E5dCC+u7U=;
        b=oerGLGHOYJ6pbcGpCBdepzVb04f7RvhSC58xaEaaQnsrces0sa8A5qDWgwdqnm7vtG
         Yw8r6OQvqkV2FQQapNAoPTmMKJsMkHqZdgn80zMeRO5ZX0gJNGgUXE/kaC+dwZOp+Oby
         Qtv/nVmrxSByzTbBbeVzVuTGgUj4isWHXs2GvFseioDBQGiWeI1mckNV93ms/8jHy+6g
         GtT7l2Ae2KZ8RXdktDm/JvzSmKFk81VR+/F58tALewbyd9bPhWi/P93yokq6LzD1j4bQ
         hTQWwYD/+WLlefyHbjPRWoNRuPgUtTRda/glojBNHUd7xPHoAA4K3SVancGx8VuimS03
         nMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772834; x=1763377634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZrYqw2/O2UZmuuLXYkU5bIjhuFDnuqQ3/E5dCC+u7U=;
        b=MNpE8IymdY1bLzYRO/YpizpTs1QY3jKv2IoKuvvwmarC64VEeg+fwqmztxuvHui8pq
         DdUozctD2mdFygS4+Xze0TJnxRWg8JOtlzNlqETTjzVMTSmQU3hpq4Mj5YTNt8LhkkNU
         YGZBpnYyX/Tru/xn1uoJGZBcGlKIGzlxEV8YyuYdjm81uVrkYT/mWUiI9GUg1qYkFhFH
         Y0yCwsC4dor6T3rd1flVw6SGvaka0cdNo3Ozc/PMJWWfE0TTPR6N+4eh5CKePUmEoOJt
         P11Ow0WvwEvLkCG/cXY8FHQeiIKk6Jue/I2E52lKksMNqN5QGjYWL3tAVYx2kMGNYnkN
         opYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCqsCvRx0zGg/aRp+d8momQs8NhO6f3ucq581lMnOyuhEB5EEQj19wzBLBz/EE0ezunOFRhehB6OwOqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYaXG/ff9nDp+f0UUcZXa1c77VY2XCrDnWKl0wcqBwF57vKKjo
	lEPizWL8p090KGPbaKywyYv3CaG5fkVZ+d3zzJ6cqv8BnLxs67Gt/+ouJZGg3Mi401I=
X-Gm-Gg: ASbGncuwlyvswOY67ZqfPZO+vWWf9PJjgxvSQSM+lS0xyuDSqPfZ7mAfRserEnLcykx
	7APLIjrbhqsCQhBkxlUq/SnOIL2t1ECiMZeRKGZJZtFh+PW7ONCavQnbUcXH5pscH+1LpG7uHi0
	NN0zKzaDgwgSKUUTTUt0uHJELUygtnt9e1xEZo7xuSvHeM8RMu4y2g9B3rcg0/+v4Y9/UXdAAvT
	H1/uVuG7DKo+E3J6F00uvG9agogbaPX7X9aUm7qnyxFsu99OMkCbJy89cWEmgY/9kmBB0DPju+O
	VcaH4NPMA+Ho9XzPqOzcLYyvSnz8FrhwL9uHy5kSXzhxGQ+KgOHzuufL2/ythDaYxf/nOf+8Mik
	TF+SPq1a/22ICOaPGGln18qpBRdD93dgxZY58NAMZon4n4+rK0xs/Vvn4k2Z4PkrJX1YLcedRD6
	mx5N+G3wTh8Tw=
X-Google-Smtp-Source: AGHT+IEEBmMVZO0k0MIdHGG3oOt1wzE07GZr0Rosgte3T2/mK8NYjyyq/dXAAAQzolcEZu8MEC+rkQ==
X-Received: by 2002:a05:6a20:12c1:b0:350:d523:80a4 with SMTP id adf61e73a8af0-353a314ff11mr11044525637.28.1762772834004;
        Mon, 10 Nov 2025 03:07:14 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c953cf79sm11625705b3a.3.2025.11.10.03.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:07:13 -0800 (PST)
Date: Mon, 10 Nov 2025 16:37:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 02/13] cpufreq: dt-platdev: Simplify with
 of_machine_get_match_data()
Message-ID: <qg6xxh3vwbfnl3z6otlr2bue2paig7w3agbpbauuzmppiof3q5@e4xjlcfu43cw>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-2-d780ea1780c2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-2-d780ea1780c2@linaro.org>

On 06-11-25, 20:07, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with two new helpers: of_machine_get_match_data() and
> of_machine_device_match().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
