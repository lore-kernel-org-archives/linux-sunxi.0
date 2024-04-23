Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2596A03F;
	Tue, 23 Apr 2024 13:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713879000; cv=none; b=GSU4iCllIHL0ZeStt+yhiKUa1z5e5UgCE6NsbmrrDJmN+Tz8XRbJJp21KULYHGvohCQQT01nH9UWGJGA/tu/BPZePX+KdYPV8aSDyx1+II0yXL+W0iUGXWxK/6aBHvu1I4x3/CoDkyaCqFYGc7sf1nXRnzh/b2sU0i4UX9nW5m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713879000; c=relaxed/simple;
	bh=bsh/D2kZbJPyTCYtBGbj/9HCY1qI0zX4uxheWAjo2D8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBxPQAo56owNNtNzFY7LutSFTUrx03CN+5I6CELORIek/Wftx4FYAj9owwFn+xwI+Xjl917MP+MHcTTvduA5Wd0HcItgVTFpNs4lc0IBa2/TkqCFd66IRd7QNslpyqkUmV9o3AMDSebGAgJZpDy9rmHYtTG2rF5eqiiv91V6kOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwtN2iZy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwtN2iZy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304BFC116B1;
	Tue, 23 Apr 2024 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713879000;
	bh=bsh/D2kZbJPyTCYtBGbj/9HCY1qI0zX4uxheWAjo2D8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HwtN2iZyQQHiIM38o9BL81d+Jc6qqv37TF65jS6sqojI84W1Ep3R7L9kH9/hnv0mK
	 6kxXfnK/4UNHDXFoycyVYxxDMdfbYmkzH38cZaODYr/RhqoMPGHfpsuKG3WS1grqwF
	 Zz20gk5n5hJs6LbSwyVrOYm6MHvIGoKIisV5q/EiLkRsDOFjoPL2NmHc8NS1LmTs8l
	 1uKlrTiQcEo6Mr/q3Z0YuOXe3AEYebASmYSW6+1RSElkKqHBHnmuhLVWsKq1htxcZ2
	 R/iX7Q4PclEfnvZl4+Q4pAFs13vEpqmEGR+WjIB+saiLuxGN9FrkB1ESOyA6A4juw3
	 9qP/W0HJFA+Vw==
Date: Tue, 23 Apr 2024 08:29:58 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, mripard@kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, linux-sunxi@lists.linux.dev,
	conor+dt@kernel.org, Chris Morgan <macromorgan@hotmail.com>,
	tglx@linutronix.de, krzk+dt@kernel.org
Subject: Re: [PATCH V2 1/2] dt-bindings: irq: sun7i-nmi: Add binding for the
 H616 NMI controller
Message-ID: <171387896940.78253.12633573740719841038.robh@kernel.org>
References: <20240418181615.1370179-1-macroalpha82@gmail.com>
 <20240418181615.1370179-2-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418181615.1370179-2-macroalpha82@gmail.com>


On Thu, 18 Apr 2024 13:16:14 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add binding for the H616 NMI controller.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml  | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Applied, thanks!

