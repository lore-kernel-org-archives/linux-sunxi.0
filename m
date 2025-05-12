Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3BFC263F25
	for <linux-sunxi@lists.linux.dev>; Mon, 12 May 2025 10:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747046958; cv=none; b=taEiI3/CkusqsM8NuEe0GyNJNelRZPSesiTbKrzEVKi6lRRchCJiDKnlCyRC3CWtz0R/q4D09VSEWAJB8yDp4/NXBDpmqTNvzg35qnesi6t+L6TPx8qp83H2FQDTQEUMOUD67nnAYeygwrB/AMkTbZj672zcTlbuJ0UV1QsqydQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747046958; c=relaxed/simple;
	bh=auuDAqllJ53P3olJgctXoxeqwJEXQoMUJigy4hjq1EA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c9Kq87rTFlTZPCVC+kVPTisqMRtRcXG5wLzXYn7UWlwymmmfV22hdQReg1WBo7gejvFsAlCHHB2d1s/2jX6w6iS+3Ol7XNxtACBP/SFLazcYreK9e5MBoCOLfnUNxtnDFWCE/uOOpVy5XEv/okaujA5I8/iz/nJoGSd7yoDTVIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21D9B150C;
	Mon, 12 May 2025 03:49:04 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C89493F673;
	Mon, 12 May 2025 03:49:13 -0700 (PDT)
Date: Mon, 12 May 2025 11:49:11 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Quentin Schulz <quentin.schulz@cherry.de>, Cody Eksal
 <masterr3c0rd@epochal.quest>
Cc: <u-boot@lists.denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Philippe Simons <simons.philippe@gmail.com>, Sumit Garg
 <sumit.garg@kernel.org>, <linux-sunxi@lists.linux.dev>, Tom Rini
 <trini@konsulko.com>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v2 1/6] sunxi: A133: add DRAM init code
Message-ID: <20250512114911.1df896ed@donnerap.manchester.arm.com>
In-Reply-To: <abf4d18b-93c0-4384-ae00-ce19f1a7dbbc@cherry.de>
References: <20250511011003.15654-1-andre.przywara@arm.com>
	<20250511011003.15654-2-andre.przywara@arm.com>
	<abf4d18b-93c0-4384-ae00-ce19f1a7dbbc@cherry.de>
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

On Mon, 12 May 2025 11:21:33 +0200
Quentin Schulz <quentin.schulz@cherry.de> wrote:

> Hi Andre,
> 
> On 5/11/25 3:09 AM, Andre Przywara wrote:
> > From: Cody Eksal <masterr3c0rd@epochal.quest>
> > 
> > This adds preliminary support for the DRAM controller in the Allwinner
> > A100/A133 SoCs.
> > This is work in progress, and has rough edges, but works on at least
> > three different boards. It contains support for DDR4 and LPDDR4.
> > 
> > [Andre: formatting fixes, adapt to mainline, drop unused parameters,
> > 	remove struct struct sunxi_mctl_com_reg, hardcode MR registers,
> > 	switch to mctl_check_pattern(), remove simple DRAM check]  
> 
> Missing Cody's and your Signed-off-by.

Yeah, I know, I am hoping for Cody to reply to this mail with the line,
since it was also missing in his github, and I don't think I can just slap
SoB lines on someone's patches.
I will add mine then as well.

Thanks,
Andre
