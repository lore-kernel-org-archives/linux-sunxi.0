Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0AC2E3373
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Mar 2025 06:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742191275; cv=none; b=Ym8FWKOFXE7aklhluGaANUfbTyKW2u8x7e7JX6lE0CkkieTKZpfrPRSBXiWIl1GJ2Q2rT+BtZzDnoSB+EcocleAWY4wKTiKvG7Zajy8N2ZwHqHV1dlgDaoHZz4YzwPg8pmAqUSjl70XOoqzOTx5hPfunGZ0u5N7R6Wm//sN3w8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742191275; c=relaxed/simple;
	bh=sYhKHIY1kH/Sv85aMyZfq/DmcwiJ9qI1WjhsBbWJhMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hh7Bci4R798+pwhXvPPaBfpLi0Qk1WwBKG/Qh7mguJNi+vAispFV1ZYEw/aDmD808VemHL938M9adwAe75IsPZ0nFMF2f7N70gUNkKgzgUVJjst2TVYttRUHnquQefjJxFMvXNJxMhZ72itxYZVu5xdWn4L2RkeVRUkHZBNlVAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sbS0Ohez; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sbS0Ohez"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-225e3002dffso33364065ad.1
        for <linux-sunxi@lists.linux.dev>; Sun, 16 Mar 2025 23:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742191273; x=1742796073; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/t696LxEbizTgZEO/Thjd7sK7TQiRojJYmJJpO8fsxc=;
        b=sbS0OhezBkaxhz65y7tyVisWQqJuVoe8zMv0ss8vy+VVBTuQd/mul+/sxVU24cjJdJ
         VePEeIon+Thcv/rDJG4lb1dl4KHvDWUfvd4dfUi3Ag7/lQzEa8I7LCwZnxQaJQcz+BG6
         PLQyl8BqG+V3WfoMfzr3JJfL3Qn8LtJnpsfJOW8PAGKLcd60RBFkdgzCUp9q5LOfZxqd
         TG7Sck1pNmf9JNEZcnpsp0QZ5NR9LM+oCY9H2/tlDkCQUOGraPNeChKp2Mhfg89C5Vlw
         ogES9lZIMurHVIElG6U7mHA0ySlPhLL080KjwK91sfq+ndW9AhMr2KrgWqPYzJ3qP7LW
         oZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742191273; x=1742796073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/t696LxEbizTgZEO/Thjd7sK7TQiRojJYmJJpO8fsxc=;
        b=HNzaEuO1vlPoESk2gJ1h0XGi5kUE2aXH8WdP1x2IV72v09+XPuvf7d4fJ2zes/5Tng
         GnfSBR5fshx7If2pzXaHzuZRi/DjWMuyHiaxUuNWpp+w4rIkDgx/Rd34qdV78+kqD6Zg
         yNuBLBHa9O74mfN91EqvpoRzuggZNOK4613iDM9rryEr8gyjW/X9N64o9ATMZ9f9YPoC
         9MkO8sxkLQuj8HKCI7dV0DhZE958aIdiOdUatV4XpGRUfbymUbzU12ni5NVUatcqq0rU
         t82Yr+uNk7+x+PCv/4WoP9Iktc2PtnyI2ONMaaQUeK5jlVEJpBCdF1GSEpoonCMhqKh+
         w/6g==
X-Forwarded-Encrypted: i=1; AJvYcCXzenFlVsfZLsQOLJz8GYWuuN0E69J6V+kUQ8qSDMcZULFnjsI2lbbUpX5jEdiCM0EIpIxTIdc0iS3wXg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGkbN3DFl9xxAtCX0Ro2Htoo7ST/rmlD/b1/bxuW8Xa8fyulxH
	Aklyffl8vSJDnXwAfEttlEZAUGwhiRv2eM4JuAurxSgDi9qAV/Xd3jqFe/9ROxs=
X-Gm-Gg: ASbGnctVO66r+EUuP9ktLjlc5L+hk6JDone9YUYdi6ztoeVNFzz52Kljhtw+Bd3hrzl
	Rdfnt6EO+65MZgfh4pMDvP2gCsxGWnf4+/gs9WyiqBTox3+p0wMiTa6WfK9Q48dGFQYMD9QeC3r
	MWPrmJu6n7+i0fjElkVqdbNZsj1I/WbUmvQ+ce6AnOj+6u65Ju5BNo3TiV6qm+aNdRICdsGa99o
	mgKfDCUGmaI/du1ek3+yVuARQnXx044LkRIBVB7tBXZz0KFDuwsPoAPehs+QqpUJiBl3Q7YjqxP
	BTRGyD+RScrLFatewaDz7FZ3w28l/VFQCjWrz9A8eupH2A==
X-Google-Smtp-Source: AGHT+IGZgTvwmbnlN60aL/w128MQKSBVf0ulmLghu2RqTVsFN9YIVHdgYTn08PK0fXwGZKBluWTVCg==
X-Received: by 2002:a17:902:e74c:b0:223:3bf6:7e6a with SMTP id d9443c01a7336-225e0a40bb3mr160011395ad.12.1742191273540;
        Sun, 16 Mar 2025 23:01:13 -0700 (PDT)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbeb94sm66648165ad.199.2025.03.16.23.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 23:01:12 -0700 (PDT)
Date: Mon, 17 Mar 2025 11:31:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jacky Bai <ping.bai@nxp.com>
Cc: rafael@kernel.org, sudeep.holla@arm.com, ilia.lin@kernel.org,
	tiny.windzz@gmail.com, wens@csie.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v3] cpufreq: Init cpufreq only for present CPUs
Message-ID: <20250317060110.tvjat7ugmaceayyk@vireshk-i7>
References: <20250313013928.529926-1-ping.bai@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313013928.529926-1-ping.bai@nxp.com>

On 13-03-25, 09:39, Jacky Bai wrote:
> for_each_possible_cpu() is currently used to initialize cpufreq.
> However, in cpu_dev_register_generic(), for_each_present_cpu()
> is used to register CPU devices which means the CPU devices are
> only registered for present CPUs and not all possible CPUs.
> 
> With nosmp or maxcpus=0, only the boot CPU is present, lead
> to the cpufreq probe failure or defer probe due to no cpu device
> available for not present CPUs.
> 
> Change for_each_possible_cpu() to for_each_present_cpu() in the
> above cpufreq drivers to ensure it only registers cpufreq for
> CPUs that are actually present.
> 
> Fixes: b0c69e1214bc ("drivers: base: Use present CPUs in GENERIC_CPU_DEVICES")
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  - v3 changes:
>   - refine the changlog to drop the changed driver list.

Applied. Thanks.

-- 
viresh
