Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C551F290D8F
	for <linux-sunxi@lists.linux.dev>; Fri,  9 May 2025 13:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796137; cv=none; b=tNRISUpvxQvv1ce1Hk6FSmw12C1IX5zkFOxCXx3wLbxFrEkvUQBTu3/l9q4QSjnLxJEW9d3Wf0uABAH9GweaJ77Cw1XkhOc02RkrBKRTANKcSB4d5cklN/BfZfVTPVJGlbUYUjw0wKHJ9B2VvwhWFOTm2WJp8Z8qPAQxWq1YbBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796137; c=relaxed/simple;
	bh=3jKAL3goVnv+0cf7KVmGqRXlYYkch85M8g6QwoX24Gc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qf6ZuhkXI2H86S4W5euOZoWqMugDIOxW/KI22mTxZ30zsba+gtp9aH833cunv6xko1cjdzD2AwS9NQPr1zBCjWF5DJ1QGMEmDvyg/2njTGyEujP1XoKFFs7YKOMcwbpjT6u5ThptVILx78gRUdVmMqeZx7u6t6vyKQicGovfRQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQxeYyQY; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQxeYyQY"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7301c227512so1748249a34.2
        for <linux-sunxi@lists.linux.dev>; Fri, 09 May 2025 06:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746796134; x=1747400934; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5Pd/m01PDi5c8NuGiBbVhA117WkSdRT+UArDIp/Z3Jk=;
        b=gQxeYyQYF/RjPiOqL6/qhpr8AE8WvZ0d36vxBvPb5DYeYpuG1K6AcpqqCb6N/SrJjy
         GlfAPQUM161xa4IrYtiAulFix/E80lRwYNsxeRNB0LWL1Phf0Mb2+d3QW1+Sr9V5enXB
         S6i+EHqIoBS3+1i1A0prOtpaLNGPSijuve5eztU+IAtFvwF48gPwRAbawrePkbux+kMa
         3nOvqYXNOX298YMSZs7n3UJ40t21a3AmbDa1ImchSpIY9EopdWQCp5zihI+eUkdMz+aw
         aaOQ0pi5uNgkA6dWsi24H4SHB4PD/kP7MBklDSaUq75Nxv4k26MWk7MPoWHpujlBRiYu
         +e6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796134; x=1747400934;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Pd/m01PDi5c8NuGiBbVhA117WkSdRT+UArDIp/Z3Jk=;
        b=PrXtIbOuWx346jNeHODKXdTKQCKM67bhJ2ed6Zgcr1SVxlD2rYQcvO61cdP0dBoHfz
         pkWRIS0MmxeulouZDYzJ4iUJsjGw+rF/BXYyE4hLKewVZTghxQo6oXFRSvgAhMy/FMt/
         /EAThDHiyuXeb9UQaj+4wh5SvoJOH6XwUG3aTlMiutBeJO3EnRP5lPnCpidWBrAsc1yF
         4NErFuCus/bvRjoM+9LEuASKBMv385zduzIOfvq+K4ad+oW1vE8U8iekHl6C9mejQNph
         0uCXoyKKWGMHCEcXcqStajmD2/kt7mogAhsqAW6ZqW9B5Xy1+xg6RypGgaNErQETKNYl
         COTg==
X-Gm-Message-State: AOJu0Yyh+b0xMzvGZAuR2hnaVDZBQH2RzApKDXM6Db6kLfOhPxDdOA9S
	/iM4k0/Q23eYEpw2ula8nTvSi9kb+iVmgSuTlC7C2ULud+ch3jr5
X-Gm-Gg: ASbGncs1RnbyBjoNpVnz8LDk5fBrfIZsFBmdLmtukCSzV9ahcbR0Z5/bppzrNTvvdTQ
	QQTcxQQBgrNw9XrkmFIQhEM2yZI33uF18Z/s+SUoV6UQMvmEAk7Z4oXXDYHl0/FYgA5T2OMjC4z
	7gLcGT+qzKNT4NIE5UfsoVLb433cuIxZXkbqwR4/CaniawS4Qs5nvhDJnMZGztIaGNkh7kpsZHm
	Ori0kDzvkMVnImLUpO+VsXTQ940ngzIlwK/o+aGdWkEuLwvwsi+bJabamQX+LWq8LYPE9bSNQTM
	U38+1tZ3Odbv9lWfVCwO580QChxyzlUEnBMR7sPmwFoqB9Pk
X-Google-Smtp-Source: AGHT+IFEqGEU4+gmYrxK27SseVuJ9zHCcIk/byTROyoULXtbOeqxt2NTixyEVGYHAQ9VcKae+xCSqQ==
X-Received: by 2002:a05:6830:4181:b0:72b:8889:8222 with SMTP id 46e09a7af769-732269fa0d7mr2673118a34.8.1746796133759;
        Fri, 09 May 2025 06:08:53 -0700 (PDT)
Received: from neuromancer. ([2600:1700:fb0:1bcf:a91d:390d:851e:20e4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732264b143bsm525881a34.20.2025.05.09.06.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 06:08:53 -0700 (PDT)
Message-ID: <681dfe65.9d0a0220.1c2d35.592e@mx.google.com>
X-Google-Original-Message-ID: <aB3-ZLAUO7YThhoF@neuromancer.>
Date: Fri, 9 May 2025 08:08:52 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, ryan@testtoast.com,
	macromorgan@hotmail.com, p.zabel@pengutronix.de,
	tzimmermann@suse.de, maarten.lankhorst@linux.intel.com,
	simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
	samuel@sholland.org, jernej.skrabec@gmail.com, wens@csie.org,
	conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH V9 00/24] drm: sun4i: add Display Engine 3.3 (DE33)
 support
References: <20250507201943.330111-1-macroalpha82@gmail.com>
 <20250508-foxhound-of-interesting-drizzle-34adae@kuoka>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508-foxhound-of-interesting-drizzle-34adae@kuoka>

On Thu, May 08, 2025 at 09:26:24AM +0200, Krzysztof Kozlowski wrote:
> On Wed, May 07, 2025 at 03:19:19PM GMT, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > I've spoken with Ryan and he agreed to let me take over this series to
> > get the display engine working on the Allwinner H616. I've taken his
> > previous patch series for Display Engine 3.3 and combined it with the
> > LCD controller patch series. I've also fixed a few additional bugs and
> > made some changes to the device tree bindings.
> > 
> > Changes since V8:
> >  - Combined the DE33 [1] series and the LCD [2] series to better track
> >    all patches necessary to output to an LCD display for the Allwinner
> >    H700.
> 
> You have here three or four different subsystems. This does not make it
> easier, but it makes it a huge patchbomb with unspecific or complex
> base.
> 
> Such combination makes no sense, because anyway it will have to be split
> per subsystem. You just know made it difficult for maintainers to review
> and apply, because they cannot apply entire set.
> 
> Best regards,
> Krzysztof
> 

I apologize, please ignore this series then. I'll break it up more
among subsystem lines and note that they are all related in the notes.

Thank you.
