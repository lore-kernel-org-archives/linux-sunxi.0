Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D34E20ADE6
	for <linux-sunxi@lists.linux.dev>; Thu,  8 May 2025 16:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746720313; cv=none; b=VGb9WgE7mhtLWX7AaYSVoVnKfK4WdsM//OFuZSkUuZ0EC1Li7Ensa8X+wWA/e8GndomXTOtN9xk4KbRfpHopTAM9wvhd/lJVUcpL1bnBt9g7KpKfnzzDIaV4UnV5ZqnBexk5Xp7hMeWFUpQeIP9urnM/dtRdR0zbaCdgDgDEXHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746720313; c=relaxed/simple;
	bh=maMWiNqhYgvQOIvaxXnh6WAgcxX5faEWOBEncaFdieo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cjzsRtHar+DPR1LRiNWAKqwiERUYwdFVBu3ZS0tKdlcZPfpIcyQhUjRtzsuE7FbfAt45cx6Slx82S4JIoi3tBCMF6ZHASePK5hr42mWOQ0TsvWWlwdD0AZAnIFEIHfPASKTFaFllo+0Sn7xcYvnrPLXbKFyAszvEdyXhHtZukYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7ECF1E2F;
	Thu,  8 May 2025 09:04:59 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDD863F5A1;
	Thu,  8 May 2025 09:05:09 -0700 (PDT)
Date: Thu, 8 May 2025 17:05:07 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Shivam Gupta <gupta.shivam1996@gmail.com>
Cc: "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH] add Eachlink H6 Mini
Message-ID: <20250508170507.3d426494@donnerap.manchester.arm.com>
In-Reply-To: <SJ1PR12MB6313678B38CB96D3C24FECE5A08BA@SJ1PR12MB6313.namprd12.prod.outlook.com>
References: <20250508143411.4534-1-gupta.shivam1996@gmail.com>
	<20250508162526.720c3649@donnerap.manchester.arm.com>
	<SJ1PR12MB6313678B38CB96D3C24FECE5A08BA@SJ1PR12MB6313.namprd12.prod.outlook.com>
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

On Thu, 8 May 2025 15:41:34 +0000
Shivam Gupta <gupta.shivam1996@gmail.com> wrote:

> Hi,
> While following the instructions to the letter on
> https://linux-sunxi.org/New_Device_howto, I sent the wrong patch. Wanted
> to add a fex file for an A10 tablet (https://linux-sunxi.org/Softwinners_crane)
> It's the next patch I sent after that.

Ah, I see. Unfortunately those instructions are somewhat outdated. I don't
think sunxi-boards is really maintained anymore, at best FEX files are
somewhat irrelevant for mainline, even Allwinner seems to have dropped
that ball many years ago.

> As a beginner I did exactly what it said, git add and send patch, but
> didn't git commit as it didn't say that anywhere, I'm sorry for that.

Yeah, I see that it proposes to send a patch to the list. Which is
somewhat pointless, as it's a github based repo, so it should follow that
process there.

> For an A10 tablet, should I still send a pull request over github or the
> email method is fine?

For that old tablet I think you can push the FEX file, via a Github PR,
though I don't know many people care about this still.
If your aim is to run (mainline) Linux, you would need a devicetree file
anyway. You can use the information in the FEX to create or generate one.

Cheers,
Andre

> https://lore.kernel.org/linux-sunxi/20250508150811.7046-1-gupta.shivam1996@gmail.com/T/#u
> 
> Thanks,
> 
> Shivam
> 
> ________________________________
> From: Andre Przywara <andre.przywara@arm.com>
> Sent: Thursday, May 8, 2025 8:55:30 pm
> To: Shivam Gupta <gupta.shivam1996@gmail.com>
> Cc: linux-sunxi@lists.linux.dev <linux-sunxi@lists.linux.dev>;
> hundertzwei <46927478+hundertzwei@users.noreply.github.com> Subject: Re:
> [PATCH] add Eachlink H6 Mini
> 
> On Thu,  8 May 2025 20:04:11 +0530
> Shivam Gupta <gupta.shivam1996@gmail.com> wrote:
> 
> Hi,
> 
> > From: hundertzwei <46927478+hundertzwei@users.noreply.github.com>
> >
> > extracted from miniH6-public-3Gddr-20181113-update.img
> > ---  
> 
> what repository is this against? I guess sunxi-boards.git on
> github.com/linux-sunxi?
> 
> This doesn't use an email based contribution process, so please send a
> pull-request via github.
> 
> Not sure how useful a FEX file for an H6 based device is anyway, but I
> guess it doesn't hurt...
> 
> Cheers,
> Andre.
> 

