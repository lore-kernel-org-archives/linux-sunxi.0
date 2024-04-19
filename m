Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8192E405
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Apr 2024 07:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713510895; cv=none; b=jgNh14y/e8rp7LJGEyFyYzvSnxSFq9x5CMjgCfZMXn7D3xE7t2qIEtm5n02YAeuMnDpvcg37fYyLoNjE7v/PUN06/Mjv/cgqnTUcDpQM5jVJdwgOf6zrx8EdBQQ5VfuzQ0zUvK36psZi22kZ5qv+0CUz3+iI6X58K42QJIhw3QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713510895; c=relaxed/simple;
	bh=EZwRuBKu4HxxbNeubieqwDvAk4cYLZBGNhSv/CphZBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdBJvNBT/mj4NAAoHXYgZJM69UUS3Pz44RTwcVjqVNXBcVcYeUIEQTEBJYIL2xWzXKjxgL1gpLMmF8+eT44TsUycZErawxIwJnOPFQGlOAMfSd4K6VP8tP7ptXzN3useXg9e1Z86nXJlhQrRA0+YdycrHG9X13m472FPyOiwF+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ApmnpyMS; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ApmnpyMS"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6f07de6ab93so1723990b3a.2
        for <linux-sunxi@lists.linux.dev>; Fri, 19 Apr 2024 00:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713510894; x=1714115694; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vhc6CEa4yodPk95tSkHjVnxQry4y1AM9/vzU+jumnV8=;
        b=ApmnpyMS2LoaTTVdfmG9nl5jIDuEsz95YDV6w5eHQUzFDQpCkDN5s0Cp47khoKXkNV
         f/nMSBck8jroArqd1j748OwqCfUYk4i3AaBKAE3xJIIM3vS2HQ3A3IoFmSRx1bbz2o/W
         TCVBvaCEqKd/RqgIRiPH8W70soF+BdIt4aDxGqb5n+xvBTFzwmFqH3g52gLxeQD+M5aY
         00dSxPMHvdh2cbKGcjFP5mPO+aIsNwMcjS8cVwGg/a3NDdoE2O+dikNQQ5UWF/IVTXOF
         p/q7A8cLcj6pGbuLj8AEjgk0/25WSdf2O1Qe0cmGBig9QEz/piTNs5JFMcqrsAhGRn0N
         aCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713510894; x=1714115694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vhc6CEa4yodPk95tSkHjVnxQry4y1AM9/vzU+jumnV8=;
        b=nDQhqAauOYtubJXLosxspoQIs5NW0myOAkJjbrPNlYVsLQybBIboPU8Iitt+t/5q5S
         xMwtW0ucIfbp1Csi1cCnTq3KHmbYV1CQQh1WNWOraSdGCYWoFIBARQWdG4YX97+wXUMl
         2rvidnthBGwC2/9RJrekMSJ2eeE7ZVjbX7pVMmQFqwBN9Zp/XoKMI3MIdW9aMJ+XLyNr
         8GgGqgtsyNfGojtGqmDOal2VS1mZN9/G/c7CCzZKDJneysbndZMD7zmBDVykHlE1fJTd
         cTmioiog6mcc0tUMOEScpBUS0L0SRFi2QJeDaFd3NjTzaOcpf7cerYKEjVMIOlC9JkzW
         tLFA==
X-Forwarded-Encrypted: i=1; AJvYcCWSEKMeK1fydPXrytY7JHavcEqueua3Og9TBVRiigCYOykf0MssS5YoXNjqYWld0NCcRcElK3gM7bNxYePf+g00XFGgfZUjIpsy8tk=
X-Gm-Message-State: AOJu0YzZdlxsU9pJ8UZP8qCG3yB5q0kFJoYABaNuEA7ql2i+uQO878hC
	kaZMLPMqP1lnLquOsM+9X417H1T0B2iqCLBT3jCCD3PWF5ajVDdqOqdPkXgUUw8=
X-Google-Smtp-Source: AGHT+IHGlJ8scQEEw8KQoTd3yaIXAQBiHEVN0IdsvDfwSNRbMjqmNmjhmzpulIebiPmnvU8XHjhvQw==
X-Received: by 2002:a05:6a21:996:b0:1a1:878d:d3f6 with SMTP id li22-20020a056a21099600b001a1878dd3f6mr1196467pzb.26.1713510893725;
        Fri, 19 Apr 2024 00:14:53 -0700 (PDT)
Received: from localhost ([122.172.87.52])
        by smtp.gmail.com with ESMTPSA id g11-20020aa7818b000000b006ecfd0bf326sm1051144pfi.99.2024.04.19.00.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 00:14:53 -0700 (PDT)
Date: Fri, 19 Apr 2024 12:44:50 +0530
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
Subject: Re: [PATCH v5 0/8]  cpufreq: sun50i: Add Allwinner H616 support
Message-ID: <20240419071450.7aiheeoyq35yjoo7@vireshk-i7>
References: <20240418154408.1740047-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418154408.1740047-1-andre.przywara@arm.com>

On 18-04-24, 16:44, Andre Przywara wrote:
> This series adds cpufreq support to the Allwinner H616 SoC.
> v5 just removes the explicit H700 speedbin support, as this proved to be
> problematic/unstable in testing. The rest is the same as v4.
> This is based on Martin's original series from about half a year ago[1].
> Thanks for the comments on the list!
> See below for a changelog.

Applied. Thanks.

-- 
viresh
