Received: from work.electricworry.net (unknown [90.216.236.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52D96AC0
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Nov 2023 12:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=electricworry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=electricworry.net
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from BOB1 (localhost [127.0.0.1])
	by work.electricworry.net (Postfix) with ESMTPS id B2D67D8932C;
	Sun, 26 Nov 2023 12:50:36 +0000 (GMT)
Date: Sun, 26 Nov 2023 12:50:34 +0000
From: Bob McChesney <bob@electricworry.net>
To: Andre Przywara <andre.przywara@arm.com>
Cc: electricworry <worryelectric@gmail.com>, u-boot@lists.denx.de,
	"linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: Re: Adding support for Orange Pi Zero 3
Message-ID: <ZWM/GuZpuBkEPc55@BOB1>
References: <CABZPTZSQHhcVuqLmg6nEiKBfF4p+R+y5sDCGaa19qztSEs54BA@mail.gmail.com>
 <20231123151709.64002286@donnerap.manchester.arm.com>
 <ZWMs0z6ED1ukmRGU@BOB1>
 <20231126123351.7275f4c7@slackpad.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126123351.7275f4c7@slackpad.lan>

On Sun, Nov 26, 2023 at 12:33:51PM +0000, Andre Przywara wrote:
> On Sun, 26 Nov 2023 11:32:35 +0000
> Bob McChesney <bob@electricworry.net> wrote:
> 
> Hi Bob,
> 
> thanks for the reply!
> 
> > Now that there's a working u-boot for the board - I've got two to choose
> > from now :) - I'm going to be concentrating on trying to get the Mali
> > graphics working as it's a requirement for my project. I've got a
> > working kernel (6.1.31 with patches) but I can also see that work's been
> > underway to bring the support to 6.7. I tested 6.7-rc2 today and can't
> > get any output at all on the console after u-boot starts the kernel.
> 
> Yeah, that's because we don't have any video (HDMI) output support
> (something completely unrelated to Mali, which is just a 3D renderer!)
> yet in mainline. Jernej was sitting on *some* patches for a while, but
> didn't have the time to upstream them, and IIUC there is something odd
> to fix first before it's mainline ready.
> There are some rough bits in here, and in other repos floating around:
> https://github.com/jernejsk/linux-1/commits/h616-hdmi-v2

The lack of console output I referred to was over the serial port. I
expected that when I swapped out my modified 6.1.31 kernel for 6.7-rc2
that I would still get serial output but nothing; the dtb in mainline
looks pretty sparse compared to mine.

> 
> Cheers,
> Andre

Regards,
Bob
