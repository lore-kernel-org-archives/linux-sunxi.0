Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A138826FD88
	for <linux-sunxi@lists.linux.dev>; Thu,  8 May 2025 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746717932; cv=none; b=h5YiXQ5LLOdLU60PO/ZD6bYMDon4ov28aVvr4gNB5VceQ8vffEN13ytWOPKmiV4AogR5UQf3/HjNEqATwijCC4844bY6DYhUDbjEa0uiwx8n4esJvc77tsz/NPUuFa2xwT0RgmYXrsFn+Rt2jU6bJcqZfJTBu+rYCsCZxbXmw8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746717932; c=relaxed/simple;
	bh=tPSXq4NlTZJEMeLQqWp3hCX5GIMJII36+4LBDDYdJzM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JmqiNFOW5DzYLJcrIdGPUdzDDiXmn0KzxXsJUZSN5twxJ3M4ropZFtNRL1r05fQ0Gye5JWZKQV1c5QD5d5oogCvuC0ng/ulzcWZjX4BZihhz7M1s0wpZEQha55HJW9ohugJO/bwI+fuEwUrAzRw8Et/hr88Q6C4FOorllDT/BSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2834F1E2F;
	Thu,  8 May 2025 08:25:19 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC72D3F58B;
	Thu,  8 May 2025 08:25:28 -0700 (PDT)
Date: Thu, 8 May 2025 16:25:26 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Shivam Gupta <gupta.shivam1996@gmail.com>
Cc: linux-sunxi@lists.linux.dev, hundertzwei
 <46927478+hundertzwei@users.noreply.github.com>
Subject: Re: [PATCH] add Eachlink H6 Mini
Message-ID: <20250508162526.720c3649@donnerap.manchester.arm.com>
In-Reply-To: <20250508143411.4534-1-gupta.shivam1996@gmail.com>
References: <20250508143411.4534-1-gupta.shivam1996@gmail.com>
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

On Thu,  8 May 2025 20:04:11 +0530
Shivam Gupta <gupta.shivam1996@gmail.com> wrote:

Hi,

> From: hundertzwei <46927478+hundertzwei@users.noreply.github.com>
> 
> extracted from miniH6-public-3Gddr-20181113-update.img
> ---

what repository is this against? I guess sunxi-boards.git on
github.com/linux-sunxi?

This doesn't use an email based contribution process, so please send a
pull-request via github.

Not sure how useful a FEX file for an H6 based device is anyway, but I
guess it doesn't hurt...

Cheers,
Andre.
