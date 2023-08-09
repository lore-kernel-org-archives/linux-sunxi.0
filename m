Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7714D3C3F
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Aug 2023 06:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1691561467; x=1692166267; i=markus.elfring@web.de;
 bh=CR6EgYDQptplQppD4a1pbnT+XzeFXpCisAKzauYQ0D0=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=JXDzXJ2rTTu0Reu5cHlqUUJM0RV4+Ht+WfEdGpG3DGCWhkuS15ZJc4+/xO9GXetWrv0tyTI
 OIVHTtCfaEYo0U+8hGp8eyYqR3csGKhleoYEBE9NYZj8bqkPg1mcoBvCGc4+sO8vhvhO2wbP0
 46fpDl4ojeyqOjSGy/1JcykBkcsvWb/tS2SsCeiakuiRpwt5mfhwVoT3tCYvBoRWJzsqGYaPZ
 7D44GcTa0pcv+fyvtworqrhdanE//B8/ywp7xIozD7jOK7gZdMCILHWim0mV7wBxnsPsUGttO
 +HEuDIJ8w4JOl3JcHCRLPhO6nFK3hP7qW37kNmcNLq6RQDTz3qeg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.86.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M1aHx-1qUzBY39Kd-002ocN; Wed, 09
 Aug 2023 08:11:07 +0200
Message-ID: <23c9ff53-82f3-491a-91f7-131cba6c607d@web.de>
Date: Wed, 9 Aug 2023 08:10:34 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3] riscv: dts: allwinner: d1: Add CAN controller nodes
To: Conor Dooley <conor@kernel.org>, linux-can@vger.kernel.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel-janitors@vger.kernel.org, John Watts <contact@jookia.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maksim Kiselev <bigunclemax@gmail.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Samuel Holland <samuel@sholland.org>, LKML <linux-kernel@vger.kernel.org>
References: <20230807191952.2019208-1-contact@jookia.org>
 <49ce2d9c-eb38-4ceb-bae1-0409df876e9b@web.de>
 <20230808-swerve-tartly-07140c59539e@spud>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230808-swerve-tartly-07140c59539e@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:vc4RSDTSTk/fGcfShTXLNUrXlNB2Vyv+JJiK9m6Dmn7E3oKaYqX
 s8kfD84BD37Oy3oPBza9KmRtT184K5+XIFHnL9VIEwQKnx605ahNg2Os4hpm05g6fWS4g7k
 J4iXwmDrcwWPJ4J/qWtlBa6/hbaDtB2nGwxCzSXkOiOXlOSzHADiDpMFKJu95uI5nC7USsR
 f+ThR86lqZqtvOCxzwHSg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/CtHlBkDZzw=;lOvXretq27LFIYsb8VR2mgdVUFB
 V/7/wUwBnKCHLZ5Dqm5pZkPA3CQra3vGSBSyGeDm4/7iBHKg1ERyIM5WwTn2thmHmxpfyiTUO
 RdzI+lAIdeoNWiwmW6U7X+hjqgAgnfGZW/1zlfu01zmDh3Ho7R++I8VzknWcycgeEKN4+nlt2
 33/7zA5VAzH8N4IYH2RxNdqizhh4fXGE8Bovu9JWpq4E2oyBm4M4LCfqLf7CVJYovW+D0K+Ck
 nKE/svY0VORit/ro07sv9IxJxhQjtM3zlNvA2NtoNydfLrCC4UhkJybr4lAPlEV0C6ops11A4
 oIl05wyw5n6dQlFCNf+bQcqzOY436eAc7sTFd5pkG/S428rFpTqyToUR5HClt2Y0MOfZrVe0I
 x/aWuETLSkx0TeDPL95WZyWOGFjmwxkWB/iEntHBsc8tHFxywx9tmV4wdpT8Vd9mjQGUDT2Mx
 lcxgD3IDQAsPFfW4vAKs+XQkHnjySmOB0+Zh3nQiWinkDC2G3wvmbwurrTL7/OcwlAq+Enu7i
 OWztCZ9mQwpu6lG0uEFne9NzP58HrnAvhvxfMpSSiP8NPMkwTS993AarqivjC3OGURpjMrqYt
 E3gwfLBG5o/4A9qX6bywiMLVeLnw1d9HWQB7Cs1RQJQ9WvQPVvI9qPlGaaAIOjLmuBbRMBXa2
 LHhhLnEqMo7R1hPStKPdgxouwc/EhIt0rndigxxZ5O981nkVx4GxWX/25c7e7+CCgexwi8gZf
 fpD/vGc5QVwgi0Bi0dOiX2+oCMvUoguDwNnnC8G7U4PqMd/p1wc2mGdKu5CA4kk07DbDAVhBP
 JQTJZItiUu0nbrDyX9G0PsTvNbzPDfXzxl1blAGozXdOZ2kc28A8cYeDm2Ohfo7Nt8wRs8+6h
 RWfxJxY/L4yoLnZuCS7jWoLyG44Hdm03WR02MfbdtGiRxKqpKQYMvLkx+0eKEgNdVc5JO0FvH
 jjnFMQ==

> Markus, please stop bothering developers with nuisance comments.

Why do you interpret a recurring patch review in such a direction?

How much do mentioned concerns hinder the integration of the discussed patch?

Regards,
Markus
