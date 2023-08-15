Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE526625
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Aug 2023 00:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D465C433C8;
	Tue, 15 Aug 2023 00:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692059870;
	bh=ubU1qJZKk3bzBUfLAI3KRwP4DlPCyvxsYECxwGBOIZ0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=VWCd4Jj+OtVbHhGPBlB4TnL6MIIsQYALM63RjU23lnzstIU3uPnBWIidNpfgsy+Qy
	 4aK/XcOLLk6KddsW5blqjQsm0XFbenXoll2BmXLp5DgJnEdydnjjn0yxQidM6hUR7q
	 uZ1mtRGC22KNkaIZOx8ge4vwbFT4M/kyTXcHWlt7r1mJWZMk+vdPqpUeM+gSWH2cc3
	 duSGDd4ABI8ksrIqnRsJe0dQXI4spwJx73V3BYU4ZfKMjl4QopCSOyD6EowXJz8iM0
	 uA33sWVQg92qvN0hJzP2x2qg/b8N9pxFi6IxLcvzPQsErjdBRFBhYWxqg0L6Ey620V
	 sjXabOVhvHixg==
Message-ID: <f0f5ecf30d429755880dc530d71df405.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZNja0W8oQ0PLAc7l@wens.tw>
References: <ZNja0W8oQ0PLAc7l@wens.tw>
Subject: Re: [GIT PULL] Allwinner clock changes for 6.6 part 2
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 14 Aug 2023 17:37:48 -0700
User-Agent: alot/0.10

Quoting Chen-Yu Tsai (2023-08-13 06:29:53)
> Hi,
>=20
> Please pull another round of Allwinner clk patches for the 6.6 cycle.
>=20
>=20
> Thanks
> ChenYu
>=20
>=20
> The following changes since commit 075d9ca5b4e17f84fd1c744a405e69ec743be7=
f0:
>=20
>   clk: sunxi-ng: Modify mismatched function name (2023-07-31 00:52:36 +02=
00)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-6.6-2
>=20
> for you to fetch changes up to a69f9463397e56666b113eebb2e99956aacf6929:
>=20
>   clk: sunxi-ng: nkm: Prefer current parent rate (2023-08-09 23:41:44 +08=
00)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
