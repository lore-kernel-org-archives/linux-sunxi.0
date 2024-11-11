Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A333814A630
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Nov 2024 04:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731298397; cv=none; b=Fu4S85ntwJcbJJLRG9k0dXFZ9Lk+euy6PoKvt5Xx12w7xmseflgX0DRUyIbef5GH2SWeNwiX4G7eAp0gtC0CXTrYpORWOmWyrrrPlyXsPF7Idq9Y11fWCkEQenADqVRondRgLvcqIbf76fgGofYGTqiTfS683WNlIUFqd6X0zMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731298397; c=relaxed/simple;
	bh=5Vg5LKlFHRSRZSf6nL2juDCBh/tRwylEiwuI7e/LabQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwTMjVSN/jHiQqkmmf7N/p6rL7f1cf0qPFubiM90sQrjTSCQNO91QqBtNn8y7MvWVdm8Lq3bhT20bVNEpRfCEoz7oyPcdl5tyIWJUdCF1gr7kYydlPN8uMgwIJYOImDqbhepZnNGVtJ6iYPq8HzKN8emWvQi2gBNRmjhz9mjSkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OU45XwpO; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OU45XwpO"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3a6bd37f424so16385455ab.2
        for <linux-sunxi@lists.linux.dev>; Sun, 10 Nov 2024 20:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731298395; x=1731903195; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q8MtdHLQlnE39Q/Ipi2Y33s1bnwJbhLgXZcQQfcZ9Dc=;
        b=OU45XwpO7IzrIOKVjJvAIwICo+0bbEv98LBaB58g8/F0RCcPNDlDwoG6BV4g2Mgrvt
         h/Rny/X9EchkiDDetn/ZyWUjRIivEvR5Y7mAvkfBxOgxYkILM1CsF4KEfTyWyIGo/yGV
         FvjB75qCx+XL256WqZhy6AJab8GUR/k7qhA2RrU+4In9QkSj24DdaStE5wNa9eEGXES0
         2BzwUWO3Q2DzYuwVdAdh41cJ6TVNryprhYeuNDcgb/AaHmz4TMh/tyrFAj4aK6XtK00l
         +UtUvWY3asY+kAqviP+glBWJLjTN6B4iNmoGePCbLIA94ZJnHH6UN3ccrf7T4YXLSx2M
         brQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731298395; x=1731903195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8MtdHLQlnE39Q/Ipi2Y33s1bnwJbhLgXZcQQfcZ9Dc=;
        b=sZnjOgNkaLwQO0SpFJQJktXP97YxE9/xcYnz7Br8zEupyeEJsq94r34ytceCCTjwFK
         FFIu9GzgPod46GGhN8fTOygoczxYeF1AAFN+1d/C994c3iX+MNmAF0Tu2CKxQ25dI5Ay
         jcQSA8fFcl1vjTEPMDp136a7InbTfja2KgRzkAMl7rcQubo+xTc4ydeZ0s318Wm9D4Xx
         qDFUhB44L2SK/p14KgDw5Pw89zfBFqs9HL/iTMuS5LqzUKYXyvbqeLV+WIpiE+UbDVYe
         lTnHHVzOeCJpmLGyeveUuUL64+WaLWXYD1wLxT8rYOrLuIQHPKq0HadFzmyAmnFpwcEU
         lVuA==
X-Forwarded-Encrypted: i=1; AJvYcCXpgod5aL1vOPUDpUekhN57eSHs9ZYBZCHacVdyoxdlnW45SUuwv+AG5xnT5s41rXI/+RqFThhX1HWBdQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2Ki9bTt/Z7Bkn0v2vVkr1WF6QJl1XxsyxxqwsMven3cZNfMl2
	XB73FcLCx95cj12vxkho8Ln6VqtykQFRQ+TUfxKT4KwBbWCb/2T0REOEHARGnkY=
X-Google-Smtp-Source: AGHT+IE8pyAAVUtA2paQ66tQO5vUZ71OyT+KLnUQAUEAU5tTlgSVZPHhBhmkiVG+VvVFIMNzcTXwGw==
X-Received: by 2002:a05:6e02:18c7:b0:3a0:9952:5fcb with SMTP id e9e14a558f8ab-3a6f1a2e2b3mr121627285ab.17.1731298394659;
        Sun, 10 Nov 2024 20:13:14 -0800 (PST)
Received: from localhost ([122.172.86.146])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f5e9c61sm7533387a12.49.2024.11.10.20.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 20:13:14 -0800 (PST)
Date: Mon, 11 Nov 2024 09:43:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Parthiban <parthiban@linumiz.com>,
	Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 12/13] cpufreq: sun50i: add a100 cpufreq support
Message-ID: <20241111041311.hleaz5fgipsyxigm@vireshk-i7>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
 <20241031070232.1793078-13-masterr3c0rd@epochal.quest>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031070232.1793078-13-masterr3c0rd@epochal.quest>

On 31-10-24, 04:02, Cody Eksal wrote:
> From: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> 
> Let's add cpufreq nvmem based for allwinner a100 soc. It's similar to h6,
> let us use efuse_xlate to extract the differentiated part.
> 
> Signed-off-by: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> [masterr3c0rd@epochal.quest: add A100 to opp_match_list]
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> ---
> Changes in V2:
>  - Add the A100 to the cpufreq-dt-platdev blacklist.

Can this be applied to the cpufreq tree separately ?

-- 
viresh
