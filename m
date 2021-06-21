Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61FD173
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Jun 2021 23:36:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B2D760FE7;
	Mon, 21 Jun 2021 23:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624318578;
	bh=Nq6GyOZTx26SYTU/bBkZQoGWAQrWsQR9gO9qe+B/1zs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OJ/ZGESBVXu4deVGBZiu8+psPU6ivgOx2/sZKkgTvKBmTjqfgjZ2J7fKV+dnc0/J+
	 OYCDZmmYrHgjckeL8cTLHlm7l2SSvBUjiCQnja1LeZPUb3OUwpLwxp1M/c76TCU4Dx
	 8S/c/g1czEr46mj4whiK5VYXuYduQYNoHw31HXuz3azQBmnZwzawPtsEYFaZ8mrpuQ
	 ZR9Xir2yeX90HH6DJ66gRZE+o7563KS8C5gvDmJY38CpurhZ/+541i/RSd+u3fdZac
	 QQbQwDFUEsVb++WpH1coojSCWdMtQ06SqarOB11SKzUsKG2GOoTjXLtuRO+OeRgktK
	 6ziwsQWgxwmwQ==
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <eede2490-c702-4a9d-97d0-217424727a09.lettre@localhost>
References: <eede2490-c702-4a9d-97d0-217424727a09.lettre@localhost>
Subject: Re: [GIT PULL] Allwinner Clock Fixes for 5.13
From: Stephen Boyd <sboyd@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>
To: Maxime Ripard <mripard@kernel.org>, Mike Turquette <mturquette@baylibre.com>
Date: Mon, 21 Jun 2021 16:36:17 -0700
Message-ID: <162431857715.3552334.1051765002618667188@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1

Quoting Maxime Ripard (2021-06-11 07:55:02)
> Hi,
>=20
> Please pull the following changes for the current release.
>=20
> Thanks!
> Maxime
>=20
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627=
b5:
>=20
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/ta=
gs/sunxi-clk-fixes-for-5.13-1
>=20
> for you to fetch changes up to 47e4dc4e63e1dcb8eec01c4214bcefc248eb72ed:
>=20
>   clk: sunxi-ng: v3s: fix incorrect postdivider on pll-audio (2021-05-24 =
13:57:37 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
