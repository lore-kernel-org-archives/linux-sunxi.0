Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40622594B2;
	Tue,  7 Jan 2025 06:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736231174; cv=none; b=ujuYmIA3TzdsrvesodLJDacp3CgAKKhS6mIg0a716xJSc+RVoeG3K6o6ZwWFm/kVtn/547y4uSGxzS1Tl/M593EOssHk8bU3q5Jo5Fwh+EJTVLJejcQzBtK0kdIdcixvAHt7Bffuk2QgV9Rv+7HAr2XChpEnE1VDgs676NegkW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736231174; c=relaxed/simple;
	bh=i1VYhMl5MR4s1nJQqUvz1Lwf+9pDCILuHffqhNs/9YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIW6FC48vSMFXXxs4GsvRyFD7W2puK/NJTllNZxOGan49AgRVMbgOsSUcVmmUxKCR4K3q0xLhwtN2RpJUMJDCQ7QRHn2rIPyO2WbD7wZ/Y6ymPvfR2peupcvOancWCCETBjZO8MzV/eMAVp70Q5Es2tk32eNGK56/NXe+EhIidw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YF75aOHW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YF75aOHW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9C1C4CED6;
	Tue,  7 Jan 2025 06:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736231174;
	bh=i1VYhMl5MR4s1nJQqUvz1Lwf+9pDCILuHffqhNs/9YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YF75aOHWwKIvawG1oQFKksOJJjwP3615KtVZuJP4bvxjd60J9h1Y3KdW5oajbltS5
	 XZcPg2cN5GheV2gGP8tD4efk4phkh11Sna+N/gltVcuOOjFiDrQaTsRs+sr7uzxX1m
	 N+02XMXxI60yxYytZOvmxBQtDxmeu6NDSRFI6MwXxyJD3yPPFCa5wavgfIx6hHJtrS
	 9vsOAYAtoooa/1yqkGnJeUmgb/iU88iPoirWps82ZpwoWO2nu5CtypEMP0R9MMIQ8a
	 B0GSV1hU6jJbzKLd2FIAROC4PljZCzVsX1CTKG8jnkSWHBMnP1nSCiylSCtLghplRm
	 pV5wXJCSp5APQ==
Date: Tue, 7 Jan 2025 07:26:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: vendor-prefixes: Add NetCube Systems
 Austria name
Message-ID: <32sgaptkdm53tevvht2olhhn75kyhwnfjbpn2547ttgonvru5y@c2nhzz7swlk7>
References: <20250106190703.4015-1-lukas.schmid@netcube.li>
 <20250106190703.4015-2-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250106190703.4015-2-lukas.schmid@netcube.li>

On Mon, Jan 06, 2025 at 07:06:59PM +0000, Lukas Schmid wrote:
> NetCube Systems Austria builds Embedded Systems for use in IoT, IIoT,
> or Smart Home scenarios.
> 
> Website is still WIP, but the Links on it are active:
> https://netcubesystems.at/
> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---

`git commit --amend` (preceeded with `git add` if you changed the patch)
or `git rebase -i HEAD~3`. That's how you work on your patchset to
change it, regardless if you use manual process or `b4`.

I really have not clue what is happening with this patch - it is like
random changes appearing. Now my tag is missing, so probably the rest of
patchset also has previous issues.

Best regards,
Krzysztof

