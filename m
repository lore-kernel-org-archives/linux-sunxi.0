Received: from fx.arvanta.net (static-213-198-238-194.adsl.eunet.rs [213.198.238.194])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056D81859
	for <linux-sunxi@lists.linux.dev>; Sun,  8 May 2022 17:44:04 +0000 (UTC)
Received: from m1 (unknown [10.5.1.15])
	by fx.arvanta.net (Postfix) with ESMTP id D245E2B2FB;
	Sun,  8 May 2022 19:38:29 +0200 (CEST)
Date: Sun, 8 May 2022 19:38:30 +0200
From: Milan =?utf-8?Q?P=2E_Stani=C4=87?= <mps@arvanta.net>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Philip Rinn <rinni@inventati.org>, wens@csie.org,
	Samuel Holland <samuel@sholland.org>, robh+dt@kernel.org,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: allwinner: a64: olinuxino: Enable audio
Message-ID: <YngAFrGeivZpJ5dK@m1>
References: <4fc41278-c46c-6486-a336-f2a329bd6bd0@sholland.org>
 <20220407155145.10891-1-rinni@inventati.org>
 <40976a35-2241-a2f0-c9be-dd32c1b51814@sholland.org>
 <4727823.31r3eYUQgx@kista>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4727823.31r3eYUQgx@kista>

On Sun, 2022-04-10 at 20:23, Jernej Škrabec wrote:
> Dne petek, 08. april 2022 ob 00:06:01 CEST je Samuel Holland napisal(a):
> > On 4/7/22 10:51 AM, Philip Rinn wrote:
> > > Enable the audio hardware on the Olimex A64-OLinuXino board family.
> > > Tested on the A64-OLinuXino-2Ge8G-IND variant.
> > > 
> > > Signed-off-by: Philip Rinn <rinni@inventati.org>
> > 
> > Acked-by: Samuel Holland <samuel@sholland.org>
> 
> Applied to sunxi/dt-for-5.19. Thanks!

About week ago I made nearly same patch but Jernej pointed me to this
one. I applied this patch and it works like one I made.

Audio output works fine, but recording doesn't work at all in my tests.
I can hear myself from microphone on headphones quite fine but 'arecord'
records only some kind of white noise. Tried all alsamixer widget
combinations but didn't managed to record anything.

Kind regards
