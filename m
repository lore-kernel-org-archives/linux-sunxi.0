Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC8E463B85
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Aug 2026 14:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787928061; cv=none; b=svd8uYMu2YYDLxVRgulMIqpCcvUXVLgKOOaULUXTU4IfoqDfUJ6GzZRhKwzsNkseoxa1FsVnaIpOpMRjTf/IASy3jZgeC1+AqZjj193BANSWX0w5S+JMKoBxr3UECYv3ztn3jGkIu7mS8fMVkhvPMyrzX4uemZlIo/Ys4md5QjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787928061; c=relaxed/simple;
	bh=8bS40oV4jEPLs9Cs2elpr2P5JyOnyCM4culKHiPewYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7w4Oq7Ooe/0I19iXf7lK8cHsR8Na9FV/s9jxv9rt/J3zh+FfvqF4O0eHgPCFIVUoZpaZ2Y6MTG0TpRT9Gn5n7ZTRpZuIGyVvOyNyyLjromuP5LoqTsPq/KS/ssz7iHkN8qiX/Dd0rY8F+6Yj3v+c1GjMq2kLK3DbDk0Q/VQEHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXIjeDI4; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXIjeDI4"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-39675172593so826842a91.2
        for <linux-sunxi@lists.linux.dev>; Fri, 28 Aug 2026 07:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787928059; x=1788532859; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bTIogw4TSRkuHDeXsegqU7KIhcr5PJJOjQw48d6uweM=;
        b=iXIjeDI4xX2lg+oXJjc+IKs7n6dBC2ooo0BDD4Xz0ULi3Z/6aYvJU4jqOsOQMPsunN
         ZEpyDBBeBmPQ+GPUFuujpzsGwHlEJqw6V45lKeDkjF3MR6T+8N8pJSXZFkiVYrWs3lfQ
         FtyLo8kYBQW2v7HUJrdUWUJhhlsR+e+akde94B7jI+ZJDr2uMLr8SvIRrcxiS+dGm8y8
         ppzX3BO8L7w3ftAnIAqIrEnsrOs7AdIk5cQqwRT86KQoDFQO5A+8qdbOSrHzTByElk8L
         8e+PGwhNAnRgqVRqb5EIeX33A0ZtyZ6AoGkv30o46/3X2noH+pAcRZ8ul3TLbDgBXm7a
         TFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787928059; x=1788532859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTIogw4TSRkuHDeXsegqU7KIhcr5PJJOjQw48d6uweM=;
        b=dol1jSqjiYVj0rVtBVowZbj0bHPgnd6k2X3EvQ8/6gQ9lqcXYObQv3nUDyjqAudCy8
         9w1h7FAzlS3L4d6rm5Cfgc5Y2gstMajOijK+3r6LeFgoy6KPxnlK6MstCgRBvWM6jgG/
         1lkkXhQsuY1f7ygCCNkbi8snRJB3MY7/rdCTwu4gARcRyoJvZPkYqnc2zaEmEOG2QHSV
         7IXpTd2aRn+uANInRIfc4ComiSbvHvugPCH4teR0ebYoEtUolSNJvH5b9yrmyC7M92DU
         lkdPox2ButaiwVb0qa2Z9AccSwVoRrDZLpuUV/0sWseGfEp7gIi/RxOTwYTSfKKP97EY
         X7hg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2w4nnI4qh7o4/SCBJQGLb682LAAcS5W/sytElEioK4Gj8+QVuSAypyOWy0sxZMFQvH3SxHP5oQNT7WQ==@lists.linux.dev
X-Gm-Message-State: AFuF++n6fa4kYmSta50cdbGxQSaOQ47z6ZCOMNYXVWOw82j0kcb/ni03
	K8NI0AOjt8uXZd6TM0foyts3td3A45c1bD9jny49BVDUeOxzuVXUKcCq
X-Gm-Gg: AR+sD13Xlte78SU/E46VMw4kGjQ5BcI2gsxKsD4iDVwjhMqtsY/o5381VCcC7V/t6Ij
	heZIT3t0uqbVjaHy0P16hVnF5rzRkYBQJZHvxHywY4gmqlmTPimwx6F5d/5PIZ1kWqYVqsn7t+M
	LhDrvRRxKkApwUaXJn8Qbz5pqtLMBxuU4Hd0rtqGZKcg/pEuTA3N4NtCbcy4kQW25wVxQwH3vck
	/pK8SN0+IfuAyTM/ARxhiUiCZnZr7diCViUMV6TaKKIOPvIA4wORxGD1170Jq5jSs8yVeZeIijt
	VBZddRg9G8rbuZ+zYXZXYK4MJwc/xYZHcYqp/MLboM34wrelD/mPRk7lR+1r4ZuSoCrd1ThjjWh
	wlsYfPJ3pSGyOe7SKShkrh61CZI1YKe8qLuxFoJtYcOsY0WQSuRBeMB4A11owU9lmhHqBd63xav
	tqIfo3xyQGop64JnSxzrvuqiEbiQti/ASdFTrQg4B9YFr7RI9gVE+5kyFjBqttMeNuN8hmaTYAe
	Q==
X-Received: by 2002:a17:90b:5284:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-396d0e5f5ffmr15894627a91.1.1787928058655;
        Fri, 28 Aug 2026 07:40:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e3cf8sm6759748eec.24.2026.08.28.07.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:40:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 28 Aug 2026 07:40:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Carlo Caione <carlo.caione@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] watchdog: sunxi_wdt: preserve boot-enabled watchdog
Message-ID: <e1332541-1751-4a9f-92b6-60636ffa0a99@roeck-us.net>
References: <20260827-submit-sunxi-wdt-boot-enabled-v1-v2-1-610d37dccc97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-submit-sunxi-wdt-boot-enabled-v1-v2-1-610d37dccc97@gmail.com>

On Thu, Aug 27, 2026 at 10:42:31PM -0600, James Hilliard wrote:
> sunxi_wdt_probe() unconditionally stops the watchdog even when firmware
> left it running. This opens an unprotected interval during boot and
> prevents CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED from taking over the active
> watchdog.
> 
> Detect an enabled watchdog and decode its programmed interval. Preserve
> representable timeouts, and round the 0.5-second interval up to the
> minimum representable one-second timeout. Use the configured timeout for
> reserved interval encodings. Set the Linux reset mode and ping the
> watchdog without clearing its enable bit, then mark it hardware-running
> before registration so the watchdog core services it until userspace
> takes control. Leave disabled watchdogs untouched.
> 
> Fixes: d00680ed0026 ("watchdog: sunxi: New watchdog driver for Allwinner A10/A13")
> Cc: stable@vger.kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied.

Thanks,
Guenter
