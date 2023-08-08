Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B43D100B2
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Aug 2023 14:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1691504786; x=1692109586; i=markus.elfring@web.de;
 bh=2h1cnp+7i9fUhjXgg4fIIyANnSbEt/tBjjSanGzTm9w=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=sMy1W02TK+t3guHL/RIplshZy6GzO+vsId0QBlr8gjZ6btro9QqCADuXxDiGrk+8yw45JMr
 yN4hsN8vz+LrR04KkR5sFRANIRsAV4KNl76bWMz61cjmMMGbb5gAJK11qjiHc1QzG569If59J
 BuxpvP/d9X3vKh1C7h5wUvba3AysQZJeBNGFaj44h33jLFBUKkUm4sA7u3KlsG6DcuVkS0FrW
 8HGMaOy088PfVEyologMtkMW/SFC4FqoKnUrnPG2EQhjuA3fag/g2FTVt2A5at2wQ9E8p8q1t
 KYzR2iHk1A0QbhXW0eMj2ado4GatY/4oayWvVLuiGSiw7r+gWb6w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.86.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MF2gM-1qa0RV3JfM-00Fgbk; Tue, 08
 Aug 2023 16:26:26 +0200
Message-ID: <49ce2d9c-eb38-4ceb-bae1-0409df876e9b@web.de>
Date: Tue, 8 Aug 2023 16:26:17 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Watts <contact@jookia.org>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maksim Kiselev <bigunclemax@gmail.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20230807191952.2019208-1-contact@jookia.org>
Subject: Re: [PATCH v3] riscv: dts: allwinner: d1: Add CAN controller nodes
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230807191952.2019208-1-contact@jookia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gM1PSsHDeTwsdSH3AAhhWejmf3adkg7Y7GpsIyBwT9yz11NdqPo
 74tLuA2CVu+eTt3MS+Nrr52V56j0asPUEgOdQzzB6js7DyRpJHbvnrlKYm8gyFN8dqBbIQD
 3HWgVLZYKci62SPV0Od61Eipjnjqwukmi18yOV4vEWUecyRPqPUG4nj3uH7sYQyggaNV2OR
 o7pZ8NymJ/oQ1dcvC59Gg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:n0L3BnyFqGg=;Es+mmkzXGt5aUZjwCn2+MQbw7BK
 jQB6MLwSaWuZbxY3pcU9Kx6Qv20LIM97lfyfp1ZGqHid5/IJuHLTaFHgbJf5l2X9Q0dcWfRcf
 YxhKkg2jYCxf7GbN916FYRYHaP7kKi6Ev5Jd0u1HeuqqY6VG8QIjh4/QqgMFSRu2G0KXBAqpU
 qrZoxF7USr8OBkrtdWiQJrVXRzw/wPyn5mWcEbpOS2sMxBtCs3kYPH5GGu4yJF9pBQ3uAThtL
 WWdA+NcoOLFJapYggOibiwBPxxBATNPeJKNI40DNQ23x1qIsmlLfe4GjW9fNaSiWxdwFz0R//
 hlZsS++jL25CNKWc2j0fcaV5c0BdXJUQBdttok66zD7GuEdpbL3L12dKkNtQ8IlVazeglYMA5
 X3khfeW7xfhHPNqna5ByRrOWsChwYz/AjyPtCPNubAEAAyn+czDGe3YfSkbUfpUhQKcvV049z
 Gue4fPEcaTfRz4dmbbuH2kMsftuzyZ3ZdSX03LHPSV/Zg3i87SRjCgUrducSU7k6fzCP9l3DT
 HHsfjfLMUPY5R8YEgSwNIM8WBDPdPQHhUL8MBaPqqX7NN4kj18kA56twl8bp3GbWC3GQE7TKU
 3/n9VcDCkJugH3WssS8S4SJg0E8mMzWkTFbbUzESBelfd7RQ3Fb5vPq8sSOQGcsesEfTqfAgW
 9xlARTPcqZFCTlJMM/k5//1+wLTfneVwOoCLU8GtON6x1cLwINKzF48APbLbsmPaYrHKfxHxB
 yVG6ptw/i8zmvXGmN8Cw1MDMqa3jsbSSz7gnEYUOqn7myWCR1G4QP7j0JZoe0v41SfmCkTSrR
 Tch80qYaOTBEtCzQmC5+sxRhDiBNW+Yc9Cij4Lu9nR3OM0x6kAKBAidhs/lD7k7/cz+FYD8Ub
 xqw49hgCdJAL1jLAoWkiAHntB73s35NeK7bEwaDooLcxYRMNZ5336oZTVWoCNa0QF8KdhNBUR
 MiPXOZ+aX50J95FNw2aH1LUvH04=

=E2=80=A6
> Both of these fully support both CAN controllers.

Please choose a corresponding imperative change suggestion.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.5-rc5#n94


> Signed-off-by: John Watts <contact@jookia.org>

I find the local-part of this email address suspicious according to the De=
veloper's Certificate of Origin.
Should it usually indicate an unique person instead of the shown key word?

Regards,
Markus
