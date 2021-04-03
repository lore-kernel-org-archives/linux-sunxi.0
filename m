Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0683F70
	for <linux-sunxi@lists.linux.dev>; Sat,  3 Apr 2021 07:01:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78668611BF;
	Sat,  3 Apr 2021 07:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617433271;
	bh=RHKrj8PbMhCgrVvQKbQ6NyMGiiAUnORF6CcoP24g2mM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OiOTd9mNx9ddPgM9T2jYQT30mwtE6pTBrNuYy8GUl6AUbkrGXQL1h4DOxanbg0kOU
	 hUP9LE2DcDzCQrsV5dMXLI4cw4Ipcb5HepH92BDPQZmlZukOhsXrfk5GPy7WuVWAMf
	 tGHCsMdqPyioE/+N1UzvVZYdLWlDHzBLGHmMUMSphz5bKZZclZ+HBzqh6MQIpIDyXa
	 uHwt6WtTZAVPwYngmgHmyI1BBYxM541PqbxNSIr8TboEthnlJeB64eyjlGFDEMR+hO
	 dNcdDPx1WhOuNhugy/K94rqGieh9f6PkDypTZZRrWfiKBKMlVzpnMBDsBr5UxMnOjq
	 lTiNGj5TJjj6A==
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5b35c96d-af03-4ff9-aa1b-b486e55e44b9.lettre@localhost>
References: <5b35c96d-af03-4ff9-aa1b-b486e55e44b9.lettre@localhost>
Subject: Re: [GIT PULL] Allwinner Clock Changes for 5.13
From: Stephen Boyd <sboyd@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>
To: Maxime Ripard <mripard@kernel.org>, Mike Turquette <mturquette@baylibre.com>
Date: Sat, 03 Apr 2021 00:01:10 -0700
Message-ID: <161743327012.2260335.3049489935173031264@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1

Quoting Maxime Ripard (2021-04-02 06:53:05)
> Hi Mike, Stephen,
>=20
> Please pull the following changes for the next release.
>=20
> Thanks!
> Maxime
>=20
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab=
15:
>=20
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/ta=
gs/sunxi-clk-for-5.13-1
>=20
> for you to fetch changes up to dcc354572d094b9dcf7c532c7263ab55dd376587:
>=20
>   clk: sunxi: Demote non-conformant kernel-doc headers (2021-03-08 16:47:=
55 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
