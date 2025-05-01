Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106E819A297
	for <linux-sunxi@lists.linux.dev>; Thu,  1 May 2025 12:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746102138; cv=none; b=tPUvQMYJMGgByKk5bXjxTja60zxPtkqpwqDybxaPTSGQLQjNzvg1W4UI2aD6P6FgvAjBQiisSe8d0ijDF7RpAmYG5YYBe1sEYUPZKzy/LnvN48TQFAJOfyBs5z92hE923V2R44xPRpSiCPZJU9WP7q+aOW9Fb+KrNusVZThdcb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746102138; c=relaxed/simple;
	bh=mxKifamzzXncn/QsKCHnl10Bc/4VPOAAX/UPUk14YDM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sduB4XM2NbOlR+bUyhfG4AXLdLoxsVRYs9CPKRPn/W4qTWBB+BtO5W4OD8GvZPPl7DxQaJeCP6RvFUrM0S305EHuRh2/p1HnoyBGRvTjBaMXXWr997UxmfNyPphH+rtaTTkNAKJMqpbqqsLLbatmurIg59W6KmmjqOdup30BKPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C169F1D14;
	Thu,  1 May 2025 05:22:07 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12B663F673;
	Thu,  1 May 2025 05:22:13 -0700 (PDT)
Date: Thu, 1 May 2025 13:22:11 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: sunxi-ng: fix order of arguments in clock macro
Message-ID: <20250501132211.0310ae49@donnerap.manchester.arm.com>
In-Reply-To: <174610166405.2974716.1586244113913047340.b4-ty@csie.org>
References: <20250430095325.477311-1-andre.przywara@arm.com>
	<174610166405.2974716.1586244113913047340.b4-ty@csie.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 1 May 2025 20:14:24 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

Hi,

> On Wed, 30 Apr 2025 10:53:25 +0100, Andre Przywara wrote:
> > When introducing the SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT macro, the order
> > of the last two arguments was different between the users and the
> > definition: features became flags and flags became features.
> > 
> > This just didn't end up in a desaster yet because most users ended up
> > passing 0 for both arguments, and other clocks (for the new A523 SoC) are
> > not yet used.
> > 
> > [...]  
> 
> Applied to clk-fixes-for-6.15 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

thanks for that, but the URL here is not correct, is it? Should be the
kernel.org repo instead? Saw this already in other "applied" emails.

Cheers,
Andre


> 
> [1/1] clk: sunxi-ng: fix order of arguments in clock macro
>       commit: 4a9c3c3215491f25bc66d615faa921c814b1a479
> 
> Best regards,

