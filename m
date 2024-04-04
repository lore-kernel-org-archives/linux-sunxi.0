Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A3E2C870
	for <linux-sunxi@lists.linux.dev>; Thu,  4 Apr 2024 06:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712212832; cv=none; b=sNMvZ4rPApPgnmW9SWfnNfbc0HheojJeD2V2Q6LrvfF7UzvEosBnov49DrxQtdcititJ/0p6z3/m9QOgvWl+Q2YCkaJXNBWVG/5D+J6IvwgHaXFOfKimVSon6I2VZ4rJoqtVrxGvi6HWyW6tjaL9FYM1zQM30vaSPpTEbnqxRsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712212832; c=relaxed/simple;
	bh=345Y31+/CGyl0VNnjAwh/6woDFo67XzbRr5nBCDRsRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTpeGmrZyIpfx1GmfVeyDRlSeMaGBVBbpKJORXlfxJmv9PsBCyGU3fJEysInn1UNDq+weZ1hvAeAXWcQUt8SIpHDe7c68uohUHz2kmXJ9oGrdWwVFxS/c3YZTUbS05k+cFCIzn6RDzVKuPtRZOexex7nKZhtPAIqTVF6FqpflE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i7HbV1va; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i7HbV1va"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so544064a12.1
        for <linux-sunxi@lists.linux.dev>; Wed, 03 Apr 2024 23:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712212831; x=1712817631; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sTfKjM314F+9yuuvd2dnBl05a+EUksaSOuF5rUZDqRE=;
        b=i7HbV1va8nw590lQo7wUfg1EVrmsOPU90WMH2ArylKuQWZ55TnLgqg6UQOj2KsOcjG
         hlcG4U2RO1Ear9zIYW2+WgL2PevsKlQaRYCGVTRwLNhrClamL29Zs0cDF2FlPgi7U/dV
         yiifYveJ1cOPPtPYLBYBPg0iqQn5O/jXz3K4KbPWn0o5PcCtKzyhjO8Bx79NlxmmzzCu
         VIfR342mg91yL29H/fVBj6BEh1LcMV7O66FP5Z0tIkAGDF9rKx+j/3O/p1sABXXwux5I
         HHdF9p/o7yTNVc5f32e935JpGjU0fa71S/LuDSJ18DJkhH4E9ONRBbT+c8K5xDRMzYs8
         LNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712212831; x=1712817631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTfKjM314F+9yuuvd2dnBl05a+EUksaSOuF5rUZDqRE=;
        b=Q7leKFhsWylGHHPUG3KPakklptXh+P1gwZ23pNAKGgXuDEnWXKfvZWs94/oKPaHNnj
         zRdBxsw+CUwTCmX6BKfvk0QOsqClKKE7p41sIzt/Qq1QeTdnvQRAU0ymHpaOb6+QBPn5
         I9lwAev/hCcxTAWmC6ebW/C+mgBF2OOgOzrFJ4kzPrgDRPoDCpONzGC9V7NjqjsAjNF5
         4HEYYt67hI+f5YeV1zTiXp0tBh2M8m4ijVqteAAYFs+huc0vxoKW669zL1VYCDnj0jn3
         a93I5HSxnL9/54NPWai1Jbh+SHmHi4iP8AbccLVbWymL3WYV4eOjMeIKi47EbeJqL7rl
         AOkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLupVHQTqFDV97gbMrqcaNhiMmhrGQwv0AA701sp/OHxQv3LlqLPPPa22rxWn4ApdAepFAuwwCM9D+speV9hp8ttN6HqAoqgSgezI=
X-Gm-Message-State: AOJu0YweoJmmcXjh+F2OB+3ZlZjtSuUdxlzLWeWFzPykY4IJEcJxcRUq
	aHHh/tvsNzx9/W5hOC6vbeA/ruMOFrctEEAiLK+MW9Z3xJuhMD1xO72uAxuvxQA=
X-Google-Smtp-Source: AGHT+IFVOKVaqyVx23c/MS763nz5MYjoPJ6L/5Bhuu+heY75JfG1zsfK6FvTXL+3XuILEy2awOITdA==
X-Received: by 2002:a05:6a20:9752:b0:1a3:ae4a:92f with SMTP id hs18-20020a056a20975200b001a3ae4a092fmr1526347pzc.32.1712212830512;
        Wed, 03 Apr 2024 23:40:30 -0700 (PDT)
Received: from localhost ([122.172.85.206])
        by smtp.gmail.com with ESMTPSA id kt1-20020a056a004ba100b006eae6c8d2c3sm11141871pfb.106.2024.04.03.23.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 23:40:30 -0700 (PDT)
Date: Thu, 4 Apr 2024 12:10:27 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>,
	Martin Botka <martin.botka@somainline.org>,
	Martin Botka <martin.botka1@gmail.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Ryan Walklin <ryan@testtoast.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v4 0/8] cpufreq: sun50i: Add Allwinner H616 support
Message-ID: <20240404064027.shjqvqih7s5rnv2i@vireshk-i7>
References: <20240329141311.27158-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329141311.27158-1-andre.przywara@arm.com>

On 29-03-24, 14:13, Andre Przywara wrote:
> This series adds cpufreq support to the Allwinner H616 SoC.
> v4 allows compilation outside of arm/arm64, by making the SMCCC call
> optional, the rest of the changes are added tags and cosmetic fixes.
> This is based on Martin's original series from about half a year ago[1].
> Thanks for the comments on the list!
> See below for a changelog.

Is it okay to merge all the changes via the cpufreq tree ?

-- 
viresh
