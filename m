Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248D81E25FD
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Nov 2024 19:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730836284; cv=none; b=ePQC3PmxBmu7A8AHO7CozmQh3ZzBuDkdu5JmbcP42a3B0A4dJzNqy/OgRSs8/1IIm1kg0u69RyPjVoX3uIRAO7KFd7qRlNlGzF7hU7lKazwKTgnj7RTxd2VTf6d7d+jof06TXnnUQxKF0V5Aa1P1v8csa69oF4iEFgfdjyoVq6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730836284; c=relaxed/simple;
	bh=Wd9YBNoCVXAiGuvNwiEzfeC0VQdvvvQXwrwgZDUZCAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+o4RqUS2UPG5YBXwUzh00LbECO7GpCzWFlMsmKejq/zKStrPUPMn+XvjW8x1go92LWhNMBGI4WNUZibtQ4nczMksV0bvPfstNnlyH+A7gfwO5tEN+mRcXsNP2tjWGCsDDFdvP3LH+8Z2EifwcRfaVGEkvdGZn9vyLZFdCQv22A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nh/94Wk/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nh/94Wk/"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e13375d3so6121910e87.3
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Nov 2024 11:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730836281; x=1731441081; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2YLBx9MU/RnKu6hw2T7hL3H8SirYRCnW93a3oWsqcq4=;
        b=nh/94Wk/yKpSaagJ0aT/8+eaN0g1AReF0PZVk/EOPnBoak2WU7k26gc+DMTHY5InjZ
         Da2f0Hk/xCw9B+8xO7L94BF/JNxnX5tAl1WKOHKpEUpaG7gFG+pS0S5zKr3SsVunncM2
         ST+ukeitCy/CSfel49fyVQYTvNII7vElZHHUdlMCYmGFdnUTK63O3JqX5UGTXIKi1yQz
         hD0Ur0hnF6ELcvVUqrsbJ6cnhhkvsGC9Sw8d2c4OVbrOKOjTUAbymdhF2LA1nTaI/Ghp
         jocAUYFK7UytY2EGOv7Tjcqy0LiGkdnDOFiDfi0Vx4fx/0fTMsNJFkja/b8VZlOCWC8B
         TGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730836281; x=1731441081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YLBx9MU/RnKu6hw2T7hL3H8SirYRCnW93a3oWsqcq4=;
        b=m9Nvhti8YRRQvm8OY3ljdHcNaIfZC16rhOnhV/puUN2RGswm2uWXokaWYisCmLP/z2
         awcyz+qLFzVOrcel2jadPQESVCNG9Q5a37gwPZdyKm2BBc8X0ut9RMvkaMi4AphW61yd
         4Z0oCrkJAoXOiJmZzvhXPI9q6ml2Okfr7vfgIRoG0Csh3busRTmkpeCVrvmTq+qZaNBF
         LkeAwUJUYkgHs6Vn/aIPOa7laZI5siGZbh+CQ0iPH/db22wn7wXU7z9LDbnVx3TXhOTn
         jhPZ915ljoErvyZk1SonA4FsTAZ0ApnRlSpD+PHtGTSd7aKeODNgCmddpnOW2P7wYNx5
         YGzg==
X-Forwarded-Encrypted: i=1; AJvYcCUH4lHrsfhOZ8lTbXFg8rtsReFODqjkZh9CFU4H/gPGQWapPkohSoZFEAGVLcAJfLPXQhkCxk4PXjn4aA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmnNi8B+bW0OdDYHQQrWhPh62kyFByuu3sHYx0fUIPNWLYfbgw
	LUGxcr099xfbGrLXAilgHSSxXXpGE/6YgPqnVSSoUPKNXC8PvRh+
X-Google-Smtp-Source: AGHT+IEAvEwNFxRTIOEiFD35riTRwne/MzbdGzBgbKGwTB2zttyozqFADQNfZYmsA8AsuGWxLbzgHA==
X-Received: by 2002:a05:6512:2398:b0:53c:74a7:43e1 with SMTP id 2adb3069b0e04-53c79e2f714mr10900704e87.13.1730836280887;
        Tue, 05 Nov 2024 11:51:20 -0800 (PST)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9580bsm2249998e87.34.2024.11.05.11.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 11:51:20 -0800 (PST)
Date: Tue, 5 Nov 2024 22:51:19 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Shoji Keita <awaittrot@shjk.jp>,
	Icenowy Zheng <icenowy@aosc.io>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 1/2] arm64: dts: sun50i-a64-pinephone: Add AF8133J to
 PinePhone
Message-ID: <Zyp3N9pGWhLqmtq1@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Shoji Keita <awaittrot@shjk.jp>,
	Icenowy Zheng <icenowy@aosc.io>,
	Andre Przywara <andre.przywara@arm.com>
References: <20240908214718.36316-1-andrej.skvortzov@gmail.com>
 <20240908214718.36316-2-andrej.skvortzov@gmail.com>
 <CAGb2v65Laka+YaPyAecwxEhMkoodrXnDPn+UTwZUS_wsSBMzyg@mail.gmail.com>
 <ZuazIgLz5PP_Z8Cn@skv.local>
 <CAGb2v66-saec9RcQsCTNOz_Tz4+BSFPdDd6CEA+RrGcF6kCY=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v66-saec9RcQsCTNOz_Tz4+BSFPdDd6CEA+RrGcF6kCY=A@mail.gmail.com>

Hi Chen-Yu Tsai,

On 24-10-19 10:04, Chen-Yu Tsai wrote:
> On Sun, Sep 15, 2024 at 6:12 PM Andrey Skvortsov
> <andrej.skvortzov@gmail.com> wrote:
> >
> > Hi Chen-Yu Tsai,
> >
> > On 24-09-09 16:08, Chen-Yu Tsai wrote:
> > > On Mon, Sep 9, 2024 at 5:48 AM Andrey Skvortsov
> > > <andrej.skvortzov@gmail.com> wrote:
> > > >
> > > > From: Icenowy Zheng <icenowy@aosc.io>
> > > >
> > > > New batches of PinePhones switched the magnetometer to AF8133J from
> > > > LIS3MDL because lack of ST components.
> > > >
> > > > Both chips use the same PB1 pin, but in different modes.
> > > > LIS3MDL uses it as an gpio input to handle interrupt.
> > > > AF8133J uses it as an gpio output as a reset signal.
> > > >
> > > > It wasn't possible at runtime to enable both device tree nodes and
> > > > detect supported sensor at probe time, because both drivers try to
> > > > acquire the same gpio in different modes.
> > > >
> > > > Device tree fixup will be done in firmware without introducing new board
> > > > revision and new dts.
> > >
> > > FYI I've been working on an in-kernel prober [1] for such alternative
> > > components. This does not require firmware support.
> > >
> > > [1] https://lore.kernel.org/all/20240904090016.2841572-1-wenst@chromium.org/
> >
> > Thank you for the information.
> >
> > I've tried to use in-kernel prober from your v7 patchset [1] on top of
> > -next and it worked without any changes to firmware.
> >
> > Since there is still on-going review of your patches it looks like
> > it's to early to submit my changes for review. But I'm ready to test
> > your new patches.
> 
> FYI I'm open to either approach. If the firmware can do it, that is also
> fine. I don't know if it makes sense to have both disabled by default
> though? That would break existing users, but so would the in-kernel
> prober approach, which requires both components be marked as
> "fail-needs-probe", and also requires that the kernel driver be enabled.
> In other words, I think the firmware approach is friendlier for existing
> users that have the original batches.

Current patches leave original magnetometer enabled as before. So only
the new alternative magnetometer is disabled. Firmware prober will set
the correct status. So you are right firmware approach is a bit nicer
for existing users, nothing will change for them with any combination
of kernel and firmware. Let's go with a firmware approach with current
patches then, if nobody 

But I like your in-kernel approach as well. 
JFYI I've applied your v10 patches [1] on top of next-20241105 and retested
it with patches for magnetometer. It's available here [2]. 

1. https://lore.kernel.org/lkml/20241030072229.1013235-1-wenst@chromium.org/#t
2. https://github.com/AndreySV/linux-stable/commits/in-kernel-hwprober-magnetometer/

-- 
Best regards,
Andrey Skvortsov
