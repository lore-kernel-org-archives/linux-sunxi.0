Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE65C147C98
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Apr 2024 13:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712150352; cv=none; b=gftjP4tsdh28xCl5j90qFqTJXHZfylavdKkSMH5rsSWq0KtIExoRo80r0B0dbOfqbO6JTuE1/b1ynJEf3qizfRCUJTI+Hv3FLjvgDMknH9mn6Rt8rAxoTvFss9IgKQCE5C61ZDvAHsNUPqayPrt1DehV3QOd8ou26005KuZbcas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712150352; c=relaxed/simple;
	bh=cWyJ3cJLCpRglG8Yk4xFCKIFWdrd8x6dZaV75Jxrvbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ca1u9luLkNqLowev60hsf0QyKYM2bIggJzuqjnXlW/V8j4wBvRtMmuqy81YxkdwxGdEQbHugdUTtgn1bIrrmEBAD9At0cCCy213r2qPrHtUDpZf0tHIe3bE/GH1j7kyEtyfn1dG7mkSeO5ojpUQpsiHzSfAnI2lMlkuAjGOdMJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=nEZB8p0W; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="nEZB8p0W"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-432c947e92eso8498651cf.0
        for <linux-sunxi@lists.linux.dev>; Wed, 03 Apr 2024 06:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712150350; x=1712755150; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWyJ3cJLCpRglG8Yk4xFCKIFWdrd8x6dZaV75Jxrvbw=;
        b=nEZB8p0Wn30FGunX5cmm6HqFhrwCfW12G+RGhYeyann8apyl+TnUy2WS6Qhjp6JTrR
         Z6A1AVif+Za2B9t43oSVLyZleuF5AgfoZd9SPZNu+eJAiTDswU4A8uJxeEQ1R1BAXqnZ
         t1wUhyIGjPWI+o+zeDzIyqHRei7HSXX0hR7bzOM+eChFIC35NplPS2iFV6ALsTK0GSE9
         vmoXVOk3ao9TVCsWtV+qv0LajyrKAZTZCJr9rhsS6vDsIOm251goam0IFvOusYC9ofwV
         0zHcjYZqd7U8hPdM5IE67wQk5fpjih4rpFqPMqYbFEQ0mG14ueLr5+H2qGqpsdOqVeZF
         o3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150350; x=1712755150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWyJ3cJLCpRglG8Yk4xFCKIFWdrd8x6dZaV75Jxrvbw=;
        b=qRCgcLUQExPoYDmtsL8boCbbwFriwDOcHHKKF/evvYuUG17oVwsCWFNXNvu1AE7iHF
         +lORZbO5zH2+1695wV47e3WHVBiE+d1LPw9YOgB8WPq0Y/GTtQ+EArMCWzVJu0A7szLT
         3TBsfPicVUvw9T8B4pzuy4nYJTZh5lbM7jvtfodKUzBXrseFoadXPvTf8Q4fz5LEWlPe
         xMv8ObWtu/PgNEQAhegCG0V+ruJKPwoTwom+rJUKy35ELbEsZcfNbsre61zkKWRr64Lv
         848vbUePex8aYYTQ0nUcK2VHwFcOTxW3VZA5b73QQ0PtOg0luKk/eJrM/nR83AT0sIUI
         OMoA==
X-Forwarded-Encrypted: i=1; AJvYcCV/LlWHH3tpZkRoGLcHtNLGgFjP0bREI92irBLvqdw3DpFFVnaxw36plM1Llrb0Co1OfDpUR9wV3QkX9+/IeHaVvVdoZcDdERc4zuI=
X-Gm-Message-State: AOJu0Yyl1TjZvcyVxu4ucHlM/REnoqnSY5Re8P0lH+9aZOQRaiPr6Q4x
	0xAX2Yc/uJaGd6nCGpLZJDRamcy8k8Q2Pcm2tgRCd5FtixJKxoai5K3hXbatHRoAkk3rDU1Ptif
	XTi3teJtNG9an13V00HvrZntC9eEySiczkfyC3g==
X-Google-Smtp-Source: AGHT+IEGVCWVaM3OZyGBYvZk7eIME6rUXSm4/CdsRsbb+oN0keiU95giarhKtyBsTd58XnIkGQv2TzNnxS90eOdz7ws=
X-Received: by 2002:a05:622a:104c:b0:434:338c:31ac with SMTP id
 f12-20020a05622a104c00b00434338c31acmr3549454qte.14.1712150349909; Wed, 03
 Apr 2024 06:19:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240222173942.1481394-1-pasha.tatashin@soleen.com>
 <00555af4-8786-b772-7897-aef1e912b368@google.com> <ZfTDUGSshZUbs13-@8bytes.org>
In-Reply-To: <ZfTDUGSshZUbs13-@8bytes.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 09:18:33 -0400
Message-ID: <CA+CK2bC7jd65=eZoN7szWJKSO2TLsxxKFH8D6WjHS3_2U7=McA@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] IOMMU memory observability
To: Joerg Roedel <joro@8bytes.org>
Cc: David Rientjes <rientjes@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	alim.akhtar@samsung.com, alyssa@rosenzweig.io, asahi@lists.linux.dev, 
	baolu.lu@linux.intel.com, bhelgaas@google.com, cgroups@vger.kernel.org, 
	corbet@lwn.net, david@redhat.com, dwmw2@infradead.org, hannes@cmpxchg.org, 
	heiko@sntech.de, iommu@lists.linux.dev, jernej.skrabec@gmail.com, 
	jonathanh@nvidia.com, krzysztof.kozlowski@linaro.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	lizefan.x@bytedance.com, marcan@marcan.st, mhiramat@kernel.org, 
	m.szyprowski@samsung.com, paulmck@kernel.org, rdunlap@infradead.org, 
	robin.murphy@arm.com, samuel@sholland.org, suravee.suthikulpanit@amd.com, 
	sven@svenpeter.dev, thierry.reding@gmail.com, tj@kernel.org, 
	tomas.mudrunka@gmail.com, vdumpa@nvidia.com, wens@csie.org, will@kernel.org, 
	yu-cheng.yu@intel.com, bagasdotme@gmail.com, mkoutny@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 15, 2024 at 5:53=E2=80=AFPM Joerg Roedel <joro@8bytes.org> wrot=
e:
>
> Hi David,
>
> On Fri, Mar 15, 2024 at 02:33:53PM -0700, David Rientjes wrote:
> > Joerg, is this series anticipated to be queued up in the core branch of
> > git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git so it gets into
> > linux-next?
> >
> > This observability seems particularly useful so that we can monitor and
> > alert on any unexpected increases (unbounded memory growth from this
> > subsystem has in the past caused us issues before the memory is otherwi=
se
> > not observable by host software).
> >
> > Or are we still waiting on code reviews from some folks that we should
> > ping?
>
> A few more reviews would certainly help, but I will also do a review on
> my own. If things are looking good I can merge it into the iommu tree
> when 6.9-rc3 is released (which is the usual time I start merging new
> stuff).

Hi Joerg,

Would it make sense to stage this series in an unstable branch to get
more test coverage from the 0-day robots?

Thank you,
Pasha
