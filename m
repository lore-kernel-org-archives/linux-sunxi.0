Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEC7307AC4
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Nov 2025 11:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762772850; cv=none; b=NGIR41Y7rGMQoOJJ5GD7R5ps6dMNxn6921e4NBkwm6i0KJ7O0VzVG9lTd22QYOXr64k+fkoMPGadSLVULHUBJ8NX7MyCxz9uTI2T4PXSrCLmZBLoEOJOqminK4HiDRiBG47yTQfmeQTuN8BkVepc7Yo5Wc043UKr7FWrg5lU9dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762772850; c=relaxed/simple;
	bh=P9gC+lGzjtMArrtoyqNulbP4U/Rr/r9sqlbgUdghZh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNY132f8JBz/rmApLYBSPydGMz7jupM1/L4RHhKmh8qXmYy/1+nlTxw/UFaWsA5pSge3mxyEbF3jpCelxLYDk0wNMxY2JRSV+6lKq9mEXfEJllHsNFpaAB57AxYgm9VdclUYN246Sd+gli8+qU1SGloLPEE2+glsa1HsyUOehfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WSwPgPI4; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WSwPgPI4"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7ade456b6abso2379897b3a.3
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Nov 2025 03:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772848; x=1763377648; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l1rfVf8CR6nXwtwA2s4abFfmksXss6f4ONY3gj9LEKk=;
        b=WSwPgPI4AeGkFV4ibh/lAYShJmRV6mU39fEq/cpkKcsmeFmNH3230aSKJStFKRMp+n
         qYV6L0AQUVG0S3+RCkkm1SFcQAoCAlegiTdWXLYqSoQhFKDjTYpkwKT3fY1tyT3+k8kN
         Ob3jpOeq56Ug+tv7+1jkhWBsFESnASeA6rNso4XZHxtdbb/DU9jOylDvwNYNQrUhvM/0
         tZTXhFh37BwliZIwPfeLziboXb6MXcpjbgFy1I5S+eDF5ImOTSdugWF5PYS2sLoevVLc
         LeDotgmnJnq24Bq6O143vmRm9JIhc1O24YHoKdxR+IENP0QctPJo8dj9gL/+qcdE1nfD
         pJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772848; x=1763377648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1rfVf8CR6nXwtwA2s4abFfmksXss6f4ONY3gj9LEKk=;
        b=Mpj91arbhiMcXnUNFhrofnqRBCc8YRTJFPKHSAFN3GztmwN0OCt+tJbsLa5w+V+rQl
         ZRaWJOCa5ZcH7+NiDRBrcq44QNU6caew8qecxov9kwUJeNMUXSQTs3giYtMMpsP7uXSC
         MknuIF97tqZQ8HLjpXedypZIIXBPSVYmzsMtF/xf/MirzZ5mehK2pGa+ikdhbYzl2oXP
         p3/HosbXmxvuQ9BWKO5Qc1qUv2ffkUzh6yaEAnsYOER0AnbppFxR8cR7Jvq86Y6OyUVl
         SPCFCyPT3JyMZx3eK4AHtfX42RbEMGRJwph+5ywDPIXnu/NiVzqG00Ip8uPc+VZZlP0f
         caSg==
X-Forwarded-Encrypted: i=1; AJvYcCUC/NPh4N7wjF/wk2IAAirhFlS4QXM6bAyl6ADcHEBrfpb2VX33en36EcdEzB8TkQnF4vUqd0mcsbvldw==@lists.linux.dev
X-Gm-Message-State: AOJu0YywD5/ZiZJb01xWI/vlMzNAryp8nXE927lGmXxGwen/ZJnrnNKG
	lE+rHHXIcHW5KrO8CWRhBiHIYhPyBjr8pHyFONlc3AkQxeDR8PMe2GJwLp4RaKtYhnI=
X-Gm-Gg: ASbGnctbyxjJJm05OWAeuViwviWQl2PVB50bXNAd9K2kRiOE0WXUxJD+ClUY1k07hNZ
	EWDpTpQ85GrIRQwRaPIX7IxP1l8tOJERW4l9fpO3+THRwvr58RDrqH4CpNMuPgTfxZ4Znm9jf/v
	PM0trUFMrb4D12YiheJNUnehYBhbiMHSydIqqxaIQbrQFMsqT/WzmfogBJRp9O42Qe13jdpcke/
	qd2ZXqnckMuqrYsES+eSzxc4Q916KrT06ucdtsZxtPyINq8iuO10TgbdYfBwcU46Txx4nDpSF6r
	Eg0LZng6Z2du8ohpG2h7MORLiuqNeMhftWnkg/paN0H80gkq0HFajRN6g9LnvNGa8Wa7qAUK01S
	0UzTc4zFB61pufAoVT8XQ6iIY1W4413umQJTMCvyQr0h4x0zAnVFmoMrmSbWrNSrT/faIQKA3sE
	+n
X-Google-Smtp-Source: AGHT+IFLmvoREqyCOsxdVYWioPfB8QTyekqamyvK/6SevugbTh8+Sr7Hzt8HMarNXUtUBmALUpoibA==
X-Received: by 2002:a17:903:46c5:b0:295:fbc7:d282 with SMTP id d9443c01a7336-297e566886emr96785235ad.27.1762772847847;
        Mon, 10 Nov 2025 03:07:27 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c8ef47sm143941675ad.74.2025.11.10.03.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:07:27 -0800 (PST)
Date: Mon, 10 Nov 2025 16:37:25 +0530
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
Subject: Re: [PATCH 03/13] cpufreq: mediatek: Simplify with
 of_machine_get_match_data()
Message-ID: <elghyjazfcsbwh4tmyfgfrbstfgpijgmlfu5kytbg7yvjtx2rf@v3riwtqr4itv>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-3-d780ea1780c2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-3-d780ea1780c2@linaro.org>

On 06-11-25, 20:07, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with new of_machine_get_match_data() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
