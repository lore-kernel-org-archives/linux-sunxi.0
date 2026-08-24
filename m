Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C26F340D90
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Aug 2026 15:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584561; cv=none; b=rZHz6J7L7lQsrBwD05VISC4nP9/7yQ98i+NCNEaFOy/827cAqcN6+eFLR9awr0jRqmnDwAzCvdrfm98kt3ewmJdHAqq57U+lHs3QLBSzLg6AGQzIygmnfOFx9mn/zb3vdfFSsz2DcT94a4lQFzabNUR6wuEMtS4SoYv2fZ9heHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584561; c=relaxed/simple;
	bh=1qUsgZ8wbphGCdO7fA4r2wXYfPVuzJaLibcePC1Gy4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=kk86WELz+dAcAXYAEHCsMnuHs0BJ4sLFIv45m757R6P1bm7QRYOa8mlL9Gzm5AzMZOWwayQkj9wNJqWra+iFuWCKN0Vj8jlPOEQC1QSKWNCVrYfrd0Uc44lf+fYwTTqoGj9+HI/Qv67v1m0eHbwhq8Y1MB5I1Hz4JdSZ2EcYYqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bFpSLd6m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bFpSLd6m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EKvGLa80ZT9txpe0vw2U1X8sS6g8NCFrqzM4G1SwujA=;
	b=bFpSLd6maPmTcly4ZfaG/kwOWseEZF2aAcYa6zpkqpiLt3PKxtJJdVzafAkMJEFmQRPrnA
	SH8vmBA0ocxeoJkxQLXJtkycItCB0qvPZT6OnyicfwwQC0MY7myZdBPCNccbIFFQJPyHvF
	de0EnQKfZab85cgtoToyBo5YP/x02+E=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-x0JGMu6QODO6hwLFKAhOUA-1; Mon, 24 Aug 2026 11:15:57 -0400
X-MC-Unique: x0JGMu6QODO6hwLFKAhOUA-1
X-Mimecast-MFC-AGG-ID: x0JGMu6QODO6hwLFKAhOUA_1787584557
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-907b38aaad2so19365086d6.1
        for <linux-sunxi@lists.linux.dev>; Mon, 24 Aug 2026 08:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584557; x=1788189357;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EKvGLa80ZT9txpe0vw2U1X8sS6g8NCFrqzM4G1SwujA=;
        b=D1FMRczJ/a1RFKSGwNdrT2j9E1P63isj4H5KK3JGFd88nyV+rmnKGkew0NBzyIpPdL
         Qipof9AD2NFU7qvKo1YEcuXdczneqtAdflxaZLJzAuud4+sgjRhiH7lhg6pjcrgojBI6
         9EXPBT+FzmnTKJr3eByt1/ml0N1Se65XtbpGIJYDwWHEeZr853NlgwyceTUISmDT4oQa
         jYetVfQH9ADKtOzcEMustD/7KkYPulpdO0ehcN0aARvwL7iJF9OWFB6tSuJ3BmSOisnC
         1uFq5KEXRlCUCM1SqlZzWVcKgH/Fa/yF4vvc8YNnYOESVRNPjMmiWpu+2CQiLufpUisk
         /7Og==
X-Forwarded-Encrypted: i=1; AHgh+RrCR0xaZS3Fms6HZ3sUrQFUMSgxJF8HswcgzsVQgD+3FtHZRqHXtmjSAXzJRZEYCx+Tnq2RGBk7KasScA==@lists.linux.dev
X-Gm-Message-State: AFuF++nlw3O69u8DqbZVij6KPEYHv5foTmJUdQL9bwPcwS2LYA75Pkcz
	QWCOtsmTCJuVZZ0iMsX2wg3KU7dGHRRjIQJKVncabfVR9/+hur79XXBq6kb4ffeh9qZ3H+wcYHD
	Y2rCxS1TwrMraCyGHdvxVqEWk0EWNmRqRPZfHanKtwY/jgF+jLKTsqRHlYAygunn+
X-Gm-Gg: AR+sD13A1fFDXvJEsWt3NCeHSmAN710P4iLmdYRi9CP4xaojqaI6hZiR8sq+CYdMOvg
	JUvIXLEe+ncP5TbFnEFA8SIb8Sc8cL2BIHVTySH8u7wLBdh/zHBdHnW2sMJLfW9z8mMgILkVHIu
	RgQFobfleGK0R5gU03Di2WBABCLpxO6uTN73lRo073Xv3SUcW4SKQEJ5OIJJUxFyHaGPIvyZUJu
	X4GNBYQS9UuqQiX9u754E32gChFmwlTG3B8QmLhOtdMIjc0HLr7xSAuldbDmcPIWCp0wStEOPIW
	HTZ4tmvIQ7ORfzJn1UunjqM/E38TLaJXDKYQoPARIYSjrUa8VMQ9nHH9V7Z8n6SUSfEcAxfwI1K
	u9WvGsIImGK33D5S1NID5QG0HYftEVrVc2lU=
X-Received: by 2002:a05:6214:3c99:b0:907:5150:a2dd with SMTP id 6a1803df08f44-90c80de23camr297867556d6.14.1787584556599;
        Mon, 24 Aug 2026 08:15:56 -0700 (PDT)
X-Received: by 2002:a05:6214:3c99:b0:907:5150:a2dd with SMTP id 6a1803df08f44-90c80de23camr297866236d6.14.1787584556058;
        Mon, 24 Aug 2026 08:15:56 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c939314d2sm64503026d6.25.2026.08.24.08.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:15:55 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:15:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/sun4i: Make sure clk_init_data is fully
 initialized
Message-ID: <aoxgKneyW6uUtrVs@redhat.com>
References: <cover.1787239944.git.geert+renesas@glider.be>
 <0f37278d04c02461e17f42032a379dccfb773171.1787239944.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <0f37278d04c02461e17f42032a379dccfb773171.1787239944.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -V7S_TrLbH-sheu0NQq56PnzkEyir1Goz5fTyG4uYdc_1787584557
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2026 at 12:03:02PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

