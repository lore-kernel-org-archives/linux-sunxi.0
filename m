Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DFB158218;
	Sat, 10 May 2025 02:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746842504; cv=none; b=n6hA4ckIcL5tkd7GHPXh0fnzN4tYWQxHUJGbXchI3GH2sshgdywGhmIp51EZX1l4NUZS1wq5PoQNFyunhQg+SpqtTKnh1NzMNp0Jxx5jYhGmTqg5WsjlLWQgn1F7lvezhF7MG3W/0Wo3lHiqpZ3FSd2aVFYgv9wcgaPfYnYgAkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746842504; c=relaxed/simple;
	bh=yOBnIXqcbufAcDhjkNEiYONxoGtRX5AIaNvgV7j5bGs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l4vMTpINfU6uJQ3qyTcXiMByLJfXvXvgSBQ5g76orBR5ytGAHvSvRSBqU6Dk2jNkjMmSuj9E5Skt7W/Y69eInA6v/j7GAQswyBNrJGDwnLbxCfkP5cmUfyYbDxYa2jtMJmV7Ql/LxsPkTfJUj/7pyP5g6SJBBiWrmwIstjaQFyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBFDC4CEE4;
	Sat, 10 May 2025 02:01:44 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id EAC495FA73;
	Sat, 10 May 2025 10:01:41 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de, 
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch, 
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org, 
 jernej.skrabec@gmail.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
Subject: Re: (subset) [PATCH V9 00/24] drm: sun4i: add Display Engine 3.3
 (DE33) support
Message-Id: <174684250193.2454659.15468367756832902378.b4-ty@csie.org>
Date: Sat, 10 May 2025 10:01:41 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 07 May 2025 15:19:19 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> I've spoken with Ryan and he agreed to let me take over this series to
> get the display engine working on the Allwinner H616. I've taken his
> previous patch series for Display Engine 3.3 and combined it with the
> LCD controller patch series. I've also fixed a few additional bugs and
> made some changes to the device tree bindings.
> 
> [...]

Applied to sunxi/clk-for-6.16 in local tree, thanks!

[01/24] dt-bindings: clock: sun50i-h616-ccu: Add LVDS reset
        commit: 20fb4ac9cda06527cf60c5ec7dda7c463c9c81be
[02/24] clk: sunxi-ng: h616: Add LVDS reset for LCD TCON
        commit: 390e4cfe87cb99c80614235cbc4651c3b315a9c9

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

