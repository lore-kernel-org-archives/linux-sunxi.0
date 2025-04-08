Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6973125EFAA
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Apr 2025 05:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744091844; cv=none; b=gKq7m7JqqUqwquwAartK7Y/tjqqz2GTq3aLJkYugtTfz2iaREskpYWB4vgudeXJkwjWxYJi08q0noYGnfH2EAbASvH7kN9Rq4AZ3hNo3rTwuo1n6NakfFVUUwgKVv471gfzPaTKUNfYKQrjawzXhbLyFH4P/NYIs+r/tJV146+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744091844; c=relaxed/simple;
	bh=8doy6BPiTFR/YKQpo3lR/yUwQX15c/frOMlav3ozNUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkskgR3mog/aKFtM90RZ05McAXvsx1oSCWAL+dkbWRfq8zJ38J8NuizCvciiSbiHQaSZrd1o7mNNkW1fvi1fItI0eTZA5polITPGa2J0Hl+WUREY3JwFw4GcprtAOOKwgol/xYGVAR9FaNAFxgHa4D77Bx8ZDBa1y+phR2cFaks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NTTGhJgn; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NTTGhJgn"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-306b78ae2d1so2207492a91.3
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Apr 2025 22:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744091841; x=1744696641; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ntWAqYw/FbTf3Hq91IVHWRfD1c0otTEdS+CQ7J427hE=;
        b=NTTGhJgnP6gCeq0ZZMQhF1pFOUeDJC/3Qw1uocRvNtYuTRwVn1bDU3fAmQG59NgvLH
         g0nY2gPnYwzu/0a9c5dhRTeKt/o2KZqc8aR/WANw97lf8Z6SULU+iLpEb/yu679zFjgK
         LtetI33eopnSWo6eMipSNrjqDroEeGVCPZugFf3VyLaybTdR3SP0su4Tj0GahbWVxNEe
         tYy+onobnJejqYnKF5Lycn4MIiqItr4SzOWsrTykVVbBdftsW1zn5uxITlILnIBc2ARy
         1KkiSeYj85s0vFirhbsR4WuVJFdypnuemn6bpKKg41KIJX6SSaghJ0qzIWIBtL7kOXWN
         54Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744091841; x=1744696641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntWAqYw/FbTf3Hq91IVHWRfD1c0otTEdS+CQ7J427hE=;
        b=q0AIEbOJEvwA0BInKNsiTzdnzQvcUbNJ12vv2VqLV2Ow9Vwnjn5nBlXXms8NMSg55b
         YKfvzkt2L0KBd2UVOMNTGf5LemvRiOW9S+l/eWmWc2gPALYADuYpCyhEE/vUQbJsIEIe
         vYLh/PyeQ3apuI25x1UFxrLnC7U0lbwwInMgLrd6Tnrc8BI6A0RGu80YJgmy5JAx/gG1
         3BD+6Zi2WYVyAzSbZJiz28JU62Fe8nP0acy3dFPBwuOjXO1mqHoAiV7ileV/wyXuA+Fe
         8pbe+aloyy9wmvBts3zq3mvmDpoqKtATmBHj448V/ERgDa8dcLQd5Im4U8VdnYwiaRCL
         hEig==
X-Forwarded-Encrypted: i=1; AJvYcCWtt1vEZvzna1kVzQiTMCxDvvyXEIynr3FlCgc6rXNVaZIWik1k3uFDfKWRjA86H3vR4ettA7IraPidWg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGdsRrVSIoLaly8FDz+/7oHfTr74ie9XAtGzBwVtuVtg3LZ/2e
	925RH78+YO9ZpapWDg4VLTFvIJh1l4vB7wt6nQ6xOXNC+WIAymO01fVwvOMGv/A=
X-Gm-Gg: ASbGncsD9tcFSDyNhmF9LSxejEUo0MEpgMO+toEVfXrre0VVE/AnMsUMB6inBbPWsUH
	Mnl7ThSxamCgMEAeEMJTDmxpVxwJxVigu5qCv66/Wtw18Mm6SsqcQQ8EIUd9w2/ZQX51pCpMpyM
	/8kghFrhhElVi30tBeAFKJErbJJu/Oy6q9f53B/EvuCwPAQRzdITATmLvuKmkhuUNQp3DzPWuyF
	4ef3PhExhWyLoeiaCwc9WLgQS9RAxyprBQ6s6n26QOmFY014AHnDdhgoRKqpDw4dPg82K3hFy2g
	6CVYe/AI0gzmigFkWvdzPPRt1pZD4qcr5LHL79lcb5d3Fg==
X-Google-Smtp-Source: AGHT+IHa7mNtQoh2kE0P3zD2ru6aZMt+A87LdNqpNKujZXMzxAW0s8D/vDJRFgVZKF/JyFi3WYplYw==
X-Received: by 2002:a17:90b:2d08:b0:2ee:9b09:7d3d with SMTP id 98e67ed59e1d1-306a4894cd0mr18110280a91.19.1744091840732;
        Mon, 07 Apr 2025 22:57:20 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30588a3140asm10075622a91.29.2025.04.07.22.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:57:20 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:27:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
	Conor Dooley <conor@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mips@vger.kernel.org, imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/19] Arm cpu schema clean-ups
Message-ID: <20250408055718.4azlqljvo4qxhnu5@vireshk-i7>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>

On 03-04-25, 21:59, Rob Herring (Arm) wrote:
>  .../bindings/cpufreq/cpufreq-mediatek.txt          | 250 ---------------------
>  Documentation/devicetree/bindings/opp/opp-v1.yaml  |  18 +-

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
