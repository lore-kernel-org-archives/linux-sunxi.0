Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2410C255F5C
	for <linux-sunxi@lists.linux.dev>; Mon, 12 May 2025 10:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747046816; cv=none; b=sfTUyT+CP6lDF5SG4dh1G5Z7s0azXT8fMeT2rorawN5FLwq1amKh8d9QZjd6eDffAcxZ8HS3ChUYTPMDqzBJTnP00uhcJyms0FBN2AuD9f4svyMbE2YehcETEyQ9rv2EYwCFEEjii0k0UJhvTtp0Be+GYw1NR6IALdU/KUruRFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747046816; c=relaxed/simple;
	bh=DwsfvX8jARTuxBoEbpx2xSr740lohMpD24P1sI1UReU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bhilsz+0sT4OSMOM4sI2d/DQjs1R128UAE9FhIkOxpot6paAlC7cYZKKcm54LaKnJ16g7v8OLxMCSTIpi9pswrvWD/rWvQGWiPFfPIi8TIdkWwzTtkg5IO7qnErlfmwg8RzJ+u0+AXFgM0zhw7qR47oQ2TPCfqxavsDrAsQIFcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09763150C;
	Mon, 12 May 2025 03:46:41 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD9D33F673;
	Mon, 12 May 2025 03:46:50 -0700 (PDT)
Date: Mon, 12 May 2025 11:46:45 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: <u-boot@lists.denx.de>, Jagan Teki <jagan@amarulasolutions.com>, Cody
 Eksal <masterr3c0rd@epochal.quest>, Philippe Simons
 <simons.philippe@gmail.com>, Sumit Garg <sumit.garg@kernel.org>,
 <linux-sunxi@lists.linux.dev>, Tom Rini <trini@konsulko.com>, Jernej
 Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: allwinner: a100: Add CPU Operating
 Performance Points table
Message-ID: <20250512114645.60bff4cb@donnerap.manchester.arm.com>
In-Reply-To: <ab250c1b-d227-404d-b834-300b82b925a9@cherry.de>
References: <20250511011003.15654-1-andre.przywara@arm.com>
	<20250511011003.15654-4-andre.przywara@arm.com>
	<ab250c1b-d227-404d-b834-300b82b925a9@cherry.de>
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

On Mon, 12 May 2025 11:24:07 +0200
Quentin Schulz <quentin.schulz@cherry.de> wrote:

> Hi Andre,
> 
> On 5/11/25 3:10 AM, Andre Przywara wrote:
> > Add an Operating Performance Points table for the CPU cores to
> > enable Dynamic Voltage & Frequency Scaling on the A100.
> > 
> > Signed-off-by: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> > [masterr3c0rd@epochal.quest: fix typos in -cpu-opp, use compatible]
> > Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> > Link: https://patch.msgid.link/20241031070232.1793078-14-masterr3c0rd@epochal.quest
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > 
> > [ upstream commit: a8181e6861fec3068f393d77ff81b2aaf4ea4203 ]  
> 
> Did you use tools/update-subtree.sh to cherry-pick those commits? The 

No, I didn't, just remembered that afterwards. This would only work for
this patch anyways, since the other two DT patches are not yet merged in a
tagged release (the last one isn't even reviewed yet), so I just added them
here for completeness, to give people an idea of how the defconfig would
look like and to allow compile testing.

The plan was to maybe merge the first two patches (the DRAM code and
Kconfig bits), then wait for the DT bits to trickle in.

Thanks!
Andre

> changelog seems odd to me compared to what we usually get when using 
> that tool. Modifications of dts/upstream should only be done via this tool.
> 
> Same remark for the other DTS changes in this series.
> 
> Cheers,
> Quentin

