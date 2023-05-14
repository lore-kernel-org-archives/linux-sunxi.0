Received: from mail.rdts.de (mail.rdts.de [195.243.153.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D586FC9
	for <linux-sunxi@lists.linux.dev>; Sun, 14 May 2023 17:12:29 +0000 (UTC)
Received: from webmail.rdts.de (php1.rdts.de [82.223.13.20])
	by mail.rdts.de (Postfix) with ESMTPSA id A06F1BABA4;
	Sun, 14 May 2023 19:05:08 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Sun, 14 May 2023 19:05:08 +0200
From: Gerhard Bertelsmann <info@gerhard-bertelsmann.de>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde
 <mkl@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-can@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 kernel@pengutronix.de
Subject: Re: [PATCH 17/19] can: sun4i_can: Convert to platform remove callback
 returning void
In-Reply-To: <20230512212725.143824-18-u.kleine-koenig@pengutronix.de>
References: <20230512212725.143824-1-u.kleine-koenig@pengutronix.de>
 <20230512212725.143824-18-u.kleine-koenig@pengutronix.de>
Message-ID: <e8d411e1e01f3c7ae8bf97f2f1700e3d@gerhard-bertelsmann.de>
X-Sender: info@gerhard-bertelsmann.de
User-Agent: Roundcube Webmail/1.2.3

Am 2023-05-12 23:27, schrieb Uwe Kleine-König:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling 
> by
> returning an error code. However the value returned is ignored (apart 
> from
> emitting a warning) and this typically results in resource leaks. To 
> improve
> here there is a quest to make the remove callback return void. In the 
> first
> step of this quest all drivers are converted to .remove_new() which 
> already
> returns void. Eventually after all drivers are converted, .remove_new() 
> is
> renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Gerhard Bertelsmann <info@gerhard-bertelsmann.de>

Thanks Uwe :-)
