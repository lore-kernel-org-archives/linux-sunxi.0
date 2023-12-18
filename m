Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361BEF9CA
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Dec 2023 06:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FV9PtGUb"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d389fb3f64so7875525ad.1
        for <linux-sunxi@lists.linux.dev>; Sun, 17 Dec 2023 22:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702879793; x=1703484593; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4fv33Fm98eoYxsFhCy3k/IYwg8anoZGWSZZeryLa0Lk=;
        b=FV9PtGUbm+GMNA1jy3sDP7m+uE55OeAFripac1rTu4lYqPJ4RG/brqV26PlQPZZlTL
         H0vjGL/ppsnAKymwD5OUgGVFpMyetAQubgsN9ahHhO3kFPKYp2PlbCKmF+5jHBKFa8bN
         d18UQeEStRe6fmqA0CHVtN7gDcBXxzngeK6FyjQki52JPkR/29iW/7FZuNKaykqlaHUb
         pSLupq8xZin+NoV5sTDJpwRQcgPg/O0PnUglVIJz3/Q36Z1uG6PlJhw8MDUcGfg1Lz09
         m8uQpuvWc02DqIB4uy6Gr846c92Z5XfUxXFasKT+Rbel7rVRMcEJdOOBRfycNBExkNyH
         g2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702879793; x=1703484593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fv33Fm98eoYxsFhCy3k/IYwg8anoZGWSZZeryLa0Lk=;
        b=S8q9q6osWP5oitk1anEgVW8aimTWK6kyjdjr1UW4C9v0cHhialFvF83iKC42NqKfQj
         DWG637Ec9RCV1P4SwJ32jvq5dJzN6mSilybRohCupFe2o1m9/hN/P6/SWEM4HPE1o65y
         x/v1ts8jk1Ju5XFaTO4ZGfd0cAhjEb6SbwXWZVdu/lTsBjJtBBqFR3ufZz5KNdyr4pK5
         3/fTS2Ko6RBrdCr0HSZbheTIFKOxbxL4cO0BXWjpq1/N6sFKpMNnOPebbKRQkB+g90I9
         7Z+EBxknIQxMsNtZ2vvNUR+TG5V3XimkoX0wH/GvdOsK4ceibJUUNLFv+lWzzrEvZrid
         9rRA==
X-Gm-Message-State: AOJu0Yzw2W+7k9DGKa4J0xVivHtdw4VTc2cllpISs3GTkzH5cn0NZ+pI
	tt37fDXJZQMarPEgU2khVPGHmQ==
X-Google-Smtp-Source: AGHT+IHO/9Xk10TyLpqn8u0P4FpfNwnhyw1y6P9qlEWj/EdN4sfd0o4DUGEMCVK2HXlQ7b1MpZUXAA==
X-Received: by 2002:a17:903:2446:b0:1d0:6ffd:6e6e with SMTP id l6-20020a170903244600b001d06ffd6e6emr8491684pls.102.1702879793608;
        Sun, 17 Dec 2023 22:09:53 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id a18-20020a170902ecd200b001d058ad8770sm18245931plh.306.2023.12.17.22.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 22:09:53 -0800 (PST)
Date: Mon, 18 Dec 2023 11:39:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Brandon Cheo Fusi <fusibrandon13@gmail.com>, aou@eecs.berkeley.edu,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev, palmer@dabbelt.com,
	paul.walmsley@sifive.com, rafael@kernel.org, robh+dt@kernel.org,
	tiny.windzz@gmail.com, wens@csie.org
Subject: Re: [PATCH 4/5] cpufreq: Add support for RISC-V CPU Frequency
 scaling drivers
Message-ID: <20231218060951.yhhyini4neyusyxv@vireshk-i7>
References: <20231214111702.xdd7qlcrpqh74i3j@vireshk-i7>
 <20231215151723.46409-1-fusibrandon13@gmail.com>
 <11b5aea1-7c6e-4be5-ae01-9c4c869dc98c@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11b5aea1-7c6e-4be5-ae01-9c4c869dc98c@sholland.org>

On 15-12-23, 15:09, Samuel Holland wrote:
> Move the option to the main drivers/cpufreq/Kconfig, like QORIQ_CPUFREQ,
> which is also used with multiple architectures (PowerPC and ARM, in that
> case). We don't want two options for the same driver.

+1

-- 
viresh
