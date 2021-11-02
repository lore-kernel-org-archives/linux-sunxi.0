Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5AD2C99
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Nov 2021 21:41:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A79E560FC2;
	Tue,  2 Nov 2021 21:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635889278;
	bh=E8Q6b9kzV+qxpnKe+huC6uwsewEUSIn3GqUxFYWHWcs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=PuU/g/wO5NmCgvFCCoeYUwUF6qO/iaQEHYgd7ow4OYPCjzki3nh6zH2Klbx8Dmiyc
	 zuG6aIvBvVrvunskBg+7EQScXBSpe82yosA7Op12SBGVseTbKvTk9KqXRG4zSeVqdz
	 RSJRoeZrE1oQ31DpcLNRRjhQo4fgJMIStDcq9QBX46NyH1q2TrsIlj46O9O1e8EB81
	 Q7ApfK/zRpnkieV9JQMg7+9Gz1XiNABMO5YHwHGvjOBFXenvZ4zeVrSPINlbcscwIg
	 ZQqB6vnIB0pcctVCMCDESPjOeIHKGwiGW1seN3L2d6vjmaZvFurVbwHJMpLUYQYWqJ
	 OUc6obHnUwO6g==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210918073752.105959-1-yangyingliang@huawei.com>
References: <20210918073752.105959-1-yangyingliang@huawei.com>
Subject: Re: [PATCH] clk: sunxi: sun9i-mmc: check return value after calling platform_get_resource()
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com
To: Yang Yingliang <yangyingliang@huawei.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Date: Tue, 02 Nov 2021 14:41:17 -0700
Message-ID: <163588927731.2993099.16538060448350679890@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1

Quoting Yang Yingliang (2021-09-18 00:37:52)
> It will cause null-ptr-deref if platform_get_resource() returns NULL,
> we need check the return value.
>=20
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---

Can we delete this driver now?
