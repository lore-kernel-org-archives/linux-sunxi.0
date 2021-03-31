Received: from mail.siol.net (mailoutvs32.siol.net [185.57.226.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A531E5F
	for <linux-sunxi@lists.linux.dev>; Wed, 31 Mar 2021 19:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.siol.net (Postfix) with ESMTP id 2CE09523F72;
	Wed, 31 Mar 2021 21:18:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
	by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ECMDnI33ypo0; Wed, 31 Mar 2021 21:18:38 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
	by mail.siol.net (Postfix) with ESMTPS id EBE13523F75;
	Wed, 31 Mar 2021 21:18:37 +0200 (CEST)
Received: from kista.localnet (cpe-86-58-17-133.cable.triera.net [86.58.17.133])
	(Authenticated sender: jernej.skrabec@siol.net)
	by mail.siol.net (Postfix) with ESMTPA id 59970523F72;
	Wed, 31 Mar 2021 21:18:36 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <maxime@cerno.tech>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/2] MAINTAINERS: Match on allwinner keyword
Date: Wed, 31 Mar 2021 21:18:36 +0200
Message-ID: <9627361.1JYF2Y7Mv4@kista>
In-Reply-To: <20210331130830.64182-2-maxime@cerno.tech>
References: <20210331130830.64182-1-maxime@cerno.tech> <20210331130830.64182-2-maxime@cerno.tech>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi!

Dne sreda, 31. marec 2021 ob 15:08:30 CEST je Maxime Ripard napisal(a):
> Some drivers (phy, crypto, net) folders don't have sunxi in it but
> allwinner. Add that keyword to match on it too.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Jernej Skrabec <jernej.skrabec@siol.net>

Best regards,
Jernej


