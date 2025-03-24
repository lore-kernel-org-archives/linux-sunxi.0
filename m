Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7372E3367
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Mar 2025 05:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742795299; cv=none; b=RCgt1igoTiUfuSI9fSIG9YFOvSwqEJTQYxfFdiGXf7SWvRHwNf/JximeKfrGfi6BADpmLNBLTUe1PJeHrF86ItGbLs3eGHuatjLIpAx899ECT44G0DnQ2UIfKp5kdBpwcxqPPLiqB2L0CmDnfYOWpcz/6wOE4k6IXXx/EPExu5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742795299; c=relaxed/simple;
	bh=hFzwVsvlTm6FzsGdNshq6DKl0QckI85JLKWYGluazmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gvcFYkvobZ5uvVsC0dPNscMChwj2qHdtmmkceyAR6SZg8ErX3INCRfG+G6h0q35AVvHsnuvFSVDZJbN3CNwKq7zRsgcl0MrdbKgeSFarIVWQamVmtuisPKSrnYCkEp5yjHvDFoL6IgQ+Z/igGHohONPpnG0nWmS3mdBoOAFS+Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iKSay9fp; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iKSay9fp"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-224191d92e4so72281615ad.3
        for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 22:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742795297; x=1743400097; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/R5x+1WOSlr2ATn0vFw3CXpQGRrxOjJ4eIn39P6K6yc=;
        b=iKSay9fpWnP6GEYncISetkMFBjcm1ITN+d4Lz6k+rII4bPL5uBJgoVbPC+XUS2Vr7r
         bmvddm9FsGULKNhMW+e8Wrkb2EFwiNvj879nk9U750TABOpBDRI31aICzjdRxnkSbgD5
         jPNUzOpCX/N3knj8i5LuFdSqyXAq1V0F6jgL37LMUvBmLQLLskoDWGxoluPhXERkJNCn
         MzR1Aa2oFi8w9FSV2T8w520oiztywq2ZzXa/HoqnF86DCRRXGELCrThc+ex2tdNq3aoc
         Rx7VOyXKQNNbMopasri0Z+Q5917Xqd++gHkRWkxmkjxDzdtO860mqznDjaupW6q0ql+w
         zfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742795297; x=1743400097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/R5x+1WOSlr2ATn0vFw3CXpQGRrxOjJ4eIn39P6K6yc=;
        b=kLRC0whVzppDzKB4s7hCWx7xICAcx8KNOP3sMcbEusvlbFa9pGRl+s1mO4YwolC8tP
         P8Uxx4tWvUaSB4eSFlnASYfUAKj5eqtj8Ykz4xpR/pr4PpU66FHb8ToIW/qtdLH9X62U
         I6u1JvLIUx+8vD6F0lDerhdp3FiXEDkQq3ZtySS2PwqKHea9t+SbQ16sBRP/aEO9NSQP
         fG8HBkmkr4EhQSCPPMoo/OutqV5yTLI2+ee1sl4+jh4A/t57z+bLsEYapFsrVH6Ft/xe
         MLpKQLoREjvj6RGJ9ZNwm1t+AqU0TAc11u8Wt08irunUKtNtfE7nYZnrOuvWZRLKfdI/
         2jwg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ6oo9A01H/HouC/FJeWJlOucqbQIFZC71hnuQ0/62NGWs0kiNgme/BVEyTALLxUj0460XEmrHeMmhpw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5NyMAPtVk6t5CIwogOYSyo7jOLBIEzjSpv1ABsHJyUTouIGeY
	ngtVhwsP0Fwp0wVZRr8VyQt2YhswINS2ZZxUdYQDbBFSnCgoVjZanVf86MV011Q=
X-Gm-Gg: ASbGnctoxR9C1Efg3Vr058TiYA/S/r9MyCPGhZODzqgA1kdTIh/G67UkDzs05DH6X81
	AXxDIFSVrJ8CFQ6EfOkZ70FlstnztcZ9AKXIJ289By4P1aNSzH/bazWEPAZtEVqeK0zCXyHhOZR
	mgEzm5Gjcth25s011aukTMFlJmCGl7ctLurEd9FnfUCWo+aPUg/Ley6niRfQesxBeXgTJe6d7l3
	nrnr/p+g3woeuEjGAwdLrxXPK/7gzNmV6c58ofm3ipi2AiY2mkLhFoxAvatp2ce5IvMZBy0XSYb
	oIjRTvf5+UPZzyMLjlDh4yGN98s0LOXsY7YsnV7YjDZT6A==
X-Google-Smtp-Source: AGHT+IEjzOfTYFKH7m9L7KhblERHs6U5SD2x2kJlkL36nq/EuBvZ3tJQu+dClNO0tHh2wUcONaNzMw==
X-Received: by 2002:a05:6a00:b4e:b0:736:34a2:8a20 with SMTP id d2e1a72fcca58-73905a2300cmr18173268b3a.21.1742795296466;
        Sun, 23 Mar 2025 22:48:16 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73906158ef2sm7170982b3a.141.2025.03.23.22.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 22:48:15 -0700 (PDT)
Date: Mon, 24 Mar 2025 11:18:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: sun50i: prevent out-of-bounds access
Message-ID: <20250324054805.3x3nwl4vtvf63rwj@vireshk-i7>
References: <20250320155557.211211-1-andre.przywara@arm.com>
 <2772067.mvXUDI8C0e@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2772067.mvXUDI8C0e@jernej-laptop>

On 22-03-25, 08:38, Jernej Škrabec wrote:
> Dne četrtek, 20. marec 2025 ob 16:55:57 Srednjeevropski standardni čas je Andre Przywara napisal(a):
> > A KASAN enabled kernel reports an out-of-bounds access when handling the
> > nvmem cell in the sun50i cpufreq driver:
> > ==================================================================
> > BUG: KASAN: slab-out-of-bounds in sun50i_cpufreq_nvmem_probe+0x180/0x3d4
> > Read of size 4 at addr ffff000006bf31e0 by task kworker/u16:1/38
> > 
> > This is because the DT specifies the nvmem cell as covering only two
> > bytes, but we use a u32 pointer to read the value. DTs for other SoCs
> > indeed specify 4 bytes, so we cannot just shorten the variable to a u16.
> > 
> > Fortunately nvmem_cell_read() allows to return the length of the nvmem
> > cell, in bytes, so we can use that information to only access the valid
> > portion of the data.
> > To cover multiple cell sizes, use memcpy() to copy the information into a
> > zeroed u32 buffer, then also make sure we always read the data in little
> > endian fashion, as this is how the data is stored in the SID efuses.
> > 
> > Fixes: 6cc4bcceff9a ("cpufreq: sun50i: Refactor speed bin decoding")
> > Reported-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> 
> Thanks for fixing that!
> 
> Reviewed-by: Jernej Škrabec <jernej.skrabec@gmail.com>

Applied. Thanks.

-- 
viresh
