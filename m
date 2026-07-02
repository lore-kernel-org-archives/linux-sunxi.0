Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49350381E95
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jul 2026 15:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783007112; cv=pass; b=dhjpTRUztivsIrcnVee7yPfVDTgxAAqMd8SZXYcdSbIdSi+ZE7Q/1RHCRApCHsuyvvEUxPV5C3EHgxgcEsSyMTnViob4NdhsnHcuxmFvRIMjnD3R8U+yhshZlC2A6E4MZBhNxU3VNExrnewwS3kE22hxiTj2LSRSRx+e9IWTm6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783007112; c=relaxed/simple;
	bh=QQJMn8myl3NxMk5d1ZskradRQLy1mGcGTZNCkisiW0A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=i5zNFVt550KmkDJGNEb7FJOaagjKyo+sLkFQiN79FM1JmaxGH2K+etu7f0/zVoIDECofYIKNpBX0ZUkKFVodruL7iTZx8nyXh8j3GEs0FhyzwGxLuATphMvx/TNglmMRO0uxT8k3ou58MVBc+QXT4UGVOhe2eKQl7N9iYgvOWOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=rVuYw//9; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="rVuYw//9"
ARC-Seal: i=1; a=rsa-sha256; t=1783007077; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XzPzW8zhLp1++PSVm0XzKWsrOZe0GF0flkwjFuZNZHAbfp3EbOvXla2d8vVLXu4SoFnIAxWM4Byk1PJ9sTLiCfay62YbaFkuqplK64t2ZCQIfp0gbxGYikxtNkArcPWlMjme19GUtG1bsX/sl/nAniBlw5tDzm0LmvNuO07ddSU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783007077; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QQJMn8myl3NxMk5d1ZskradRQLy1mGcGTZNCkisiW0A=; 
	b=cZITeNJ+oB4/NZ4WmLa/xHrbEsSBgeiBrjRV2n4kupPlFJfA4UPPpJUf8EwoC+2vSKDD4DsINTRoHCUFwWRJM8CkMgkobPxSpMVT8Yd3FNcBd5NzCrceQGol68xpwXkUgd1/lpJTeEUdiNUyeZwNg1dnhz3XWTeji5uRNe+jtoo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783007077;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Reply-To;
	bh=QQJMn8myl3NxMk5d1ZskradRQLy1mGcGTZNCkisiW0A=;
	b=rVuYw//9Vqqpy+NtvvJiCkynLOyTnT0LaFydnguLYH+L0sLNxWoO3Tad7/s2IvHB
	bwPg2n34dOQHorMZ+339GS0RwlHTKXOVP38cU2B2spDAaJK8lfvL+U9jO8HRl55nMer
	Ynf1o9j9pTrE4eK0GKeHM/fXbBpOuuv0kLxpNrcM=
Received: by mx.zohomail.com with SMTPS id 1783007074425420.57335506567745;
	Thu, 2 Jul 2026 08:44:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 23:44:18 +0800
Message-Id: <DJO79318OW0A.2RDQOAXRTHNCW@pigmoral.tech>
Subject: Re: [PATCH RFC 0/8] clk: sunxi-ng: Add support for Allwinner A733
 CCU and PRCM
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Enzo Adriano" <enzo.adriano.code@gmail.com>, "Junhui Liu"
 <junhui.liu@pigmoral.tech>
Cc: "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>, "Chen-Yu Tsai"
 <wens@kernel.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Andre Przywara"
 <andre.przywara@arm.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Richard
 Cochran" <richardcochran@gmail.com>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech>
 <20260701160055.320000-a733-ccu-status-enzo.adriano.code@gmail.com>
In-Reply-To: <20260701160055.320000-a733-ccu-status-enzo.adriano.code@gmail.com>
X-ZohoMailClient: External

Hi Enzo,

On Thu Jul 2, 2026 at 12:07 AM CST, Enzo Adriano wrote:
> Hi Junhui,
>
> Thanks for the A733 CCU/PRCM RFC v1. I've been reading through the
> series and the review feedback, including the NSI clock/reset handling,
> the binding naming and ordering comments, the SDM macro cleanup, and the
> question around modeled but otherwise-unused clocks such as the GIC clock=
.
>
> I do not see a v2 on the list yet, so I wanted to check in: are you still
> planning to take this series forward? No rush at all, and I am happy to
> leave it entirely with you if so.
>
> If you have moved on to other things, I would be glad to help carry the
> series forward and address the review comments, keeping your authorship
> and prior work intact. I have A733 hardware here and can help test the
> changes.
>
> Either way, please let me know what works best for you.

Thanks for reaching out. I have already been preparing a v2 based on
Jerome's new RTC patch series. I moved to a new city this week though,
so there may be some delay, but I will try to get it out as soon as
possible.

>
> Thanks,
> Enzo

--=20
Best regards,
Junhui Liu

