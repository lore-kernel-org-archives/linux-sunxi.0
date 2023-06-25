Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2477C
	for <linux-sunxi@lists.linux.dev>; Sun, 25 Jun 2023 16:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1687712190; x=1688316990; i=markus.elfring@web.de;
 bh=mWu+5+5RD8uWNQkDyqDgTeflu8ZPfVITkxrOWnNCHsg=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=fXCOjAaq+BTK8uVy7+dFiYunYkQtR5xJwktxMwNKTxB/5vABUacyffNCMgN3uxVXKwD/tfg
 Vl5iD4o6W88BlQbyIuuRhnV61TW+vfeUfW7QZcU+gIsHlpm3lmpi6lpeiPFMCKSYhBETumuXF
 5b4+B6T47G6XssLXmao3FbBG5NFvPzxq5AILfLJiftymjveQXgBZsW40Gv/htf/NSZqItDcCL
 lSgaC41d6fcM6RhCP7nfpeArR+fIBhC1K2HGMlED0fnJwPFI0DEhutyxSw0x+2vgCyeZXqd5v
 98ODSQ63u1GTlnK8z3TTh+HXEEXWP4bJW+wZc7IH3v++wx4qntkQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MNOQy-1qOwRI0E8o-00PELV; Sun, 25
 Jun 2023 18:56:30 +0200
Message-ID: <6a5380dc-7090-c01f-f3a9-69d5898f06d1@web.de>
Date: Sun, 25 Jun 2023 18:56:27 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Maksim Kiselev <bigunclemax@gmail.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
 kernel-janitors@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maksim Kiselev <bigunclemax@gmail.com>, Mark Brown <broonie@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20230624131632.2972546-2-bigunclemax@gmail.com>
Subject: Re: [PATCH v1 1/3] spi: sun6i: add quirk for dual and quad SPI modes
 support
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230624131632.2972546-2-bigunclemax@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VyJe/m3KijFvWi87fz/heZWoJfUsbwV+dpJnM5Mi9FSKu0E5On2
 G9VnXGCx620JyEijBSk1Gj/n5iQPbw6MsZK7x1gJtNoEq4SFjqBkxxR7GrWrVbXQTmw7Efk
 0r5T41xDLuHJuesmtdzMWIu6a8yV1E/jwe3XKWc5caX0PK3QvuucBvIQY9dgOxKrhRi65y9
 7dkl63WUtu09FKz0TobXQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:50xYpXXyqLo=;0GDqroyBbI4ygY/WhdtRVr0QgfC
 OOKihxZJPjGOSdRvGOm5xJeuP5bmxQ0vL2/6iA4LE4lLVGTF5gLEmspOoaWL/61Mu2DYwMxO0
 N41yyn6H+7Wt1aJjN0ev368EaiI+XvCz3AhB6FTxMQhMFhUiyob/kzcpF1v39deTYOUU+1PGU
 dGc5l8vKxQTY/vkVqi2Q/PmEAifjcCHGcQtzyVtUaJHigHBUr43tj2kei5BjgqIt7YAivM15Z
 HqtNmyAArWxDbf6zCaSglXlGGWvoGprD0w3Dwdd02+2aCerBb1emMzpNBSiVaFlG4/VgmOWqQ
 Ji/iuXKyBs9typSxA99SwHT2TKyyGuOBB4D+WaD2Mx22GmxWUkGd9ozzd+kdiRSfAK7hTOeYR
 Y6QG3vmk8HG6OVlCtXlKSeZaNcEk5pSq5FHEuo3RKR7TSkRBvSvLhIARZSDrK8/G6OiUiXWw2
 CTc4SVpQ4/xCJt4wJYKEkAfn1BU0ZYd9SlM2Yqf4YpWlAW+CfOzaS92NBfudDwGVNDEuckV7F
 zr/qz3nWiKsT4WCbcBwH9J7qlbS4n4c3aKuIBJGd+FzJsOLXWVZihCoIpaosTzUCmZ1szcKxu
 MAAicjJNX2VTAqcfVKKA+hV679W/Hh7ScZGMKIY1/fih3o0NhCC8xRsjki106nRhcMH4dLkBs
 wFwE0mcZZn5JcIH25uelVmn0qpa5gwvPyadAyw/HR1GjosE4ny/GsqbcJhVyVssVGCD1hgr0Z
 Fx80yWotxYcWGrKDy9dejdb0UztQNXibCoeD+TVZSQ8LbGROyDH5jYfbQbVmfqqSzeHufTUVz
 nArec0DlPEsCmIGAN/6PGlJNo2fJQgbUbQAHai42P+TTe3kMkUvtiUmmJHYokQOQcW1TH7WJG
 t8rBHaoSGIWnSkB6JjKlDvLZHNxRLhwZGwMAzit3EtSrg3OAAKLADKu+leEP0cw9/DcW0rp+k
 mN8VGblaFFMKvNEdGRZxseahV/I=

=E2=80=A6
> To enable one of these modes, we should set the corresponding bit =E2=80=
=A6

Please choose imperative change suggestions.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.4-rc7#n94

Regards,
Markus
