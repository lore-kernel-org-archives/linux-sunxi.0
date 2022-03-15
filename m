Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051861B75
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Mar 2022 07:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89B2C340E8;
	Tue, 15 Mar 2022 07:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647330665;
	bh=WIiE5/Y8InLMDxSnOFGgcjcEamhcDTf2E4cGNCrfJIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AiRZtNq/KPPzYbiB4dZ/JZFPOoEoitkPYehdbuZxxfVrTv273vcA+98PRkhhW52eh
	 rNOojssfryS72K3iFabfsw1VcgD8oLIUEo2tDjn6bMm6uaPRlC834j9ZVydRIcJvkW
	 9QpEaFFAbCJsdoebJ7/TZvzZLBY0Bdhk10sE+JXo=
Date: Tue, 15 Mar 2022 08:51:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: Maxime Ripard <mripard@kernel.org>,
	Bastien =?iso-8859-1?Q?Roucari=E8s?= <rouca@debian.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, stable@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "ARM: dts: sun7i: A20-olinuxino-lime2: Fix
 ethernet phy-mode"
Message-ID: <YjBFZm496HUnvBgQ@kroah.com>
References: <20220308125531.27305-1-ynezz@true.cz>
 <20220315072846.GA9129@meh.true.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220315072846.GA9129@meh.true.cz>

On Tue, Mar 15, 2022 at 08:28:58AM +0100, Petr Štetiar wrote:
> Petr Štetiar <ynezz@true.cz> [2022-03-08 13:55:30]:
> 
> Hi Greg,
> 
> one week has passed and as I didn't received any feedback, I'm providing more
> details in a hope to make it more clear, why I think, that this fix is wrong
> and should be reverted in LTS kernels 5.10 and 5.15.

Why not reverted in Linus's tree first?  Shouldn't that be also broken
here?

thanks,

greg k-h
