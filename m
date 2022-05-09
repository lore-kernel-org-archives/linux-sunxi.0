Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EF51FAA
	for <linux-sunxi@lists.linux.dev>; Mon,  9 May 2022 14:21:48 +0000 (UTC)
Received: from mail-yb1-f180.google.com ([209.85.219.180]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MQ5f4-1nS9f82wAC-00M5zR for <linux-sunxi@lists.linux.dev>; Mon, 09 May
 2022 16:21:46 +0200
Received: by mail-yb1-f180.google.com with SMTP id v59so25194550ybi.12
        for <linux-sunxi@lists.linux.dev>; Mon, 09 May 2022 07:21:46 -0700 (PDT)
X-Gm-Message-State: AOAM530gnnAh3dCc4IKEk06byzmc5IhplHRmnJG6qyGnJSJB8Stx8qYn
	JFsGUBbf6EE82+6OALqrx8ZZ5+0rtKFMpnvC4GQ=
X-Google-Smtp-Source: ABdhPJwY5hLObxWceU0lTlqAEqwR+Th22pyO/ruNkfXVChk36C30m56Q45dWjQP0Zg2DA4IBJXRmMg4CO/psSod2Fuc=
X-Received: by 2002:a25:cbc9:0:b0:645:879a:cdd3 with SMTP id
 b192-20020a25cbc9000000b00645879acdd3mr12792799ybg.550.1652106105319; Mon, 09
 May 2022 07:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YnVUmSLE1MZFkApt@kista.localdomain> <1789096.atdPhlSkOF@kista>
In-Reply-To: <1789096.atdPhlSkOF@kista>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 9 May 2022 16:21:29 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3ePzJbh3p9edaDfZhZoYc=0-GvFCs3+2oLGjSoAhgvhw@mail.gmail.com>
Message-ID: <CAK8P3a3ePzJbh3p9edaDfZhZoYc=0-GvFCs3+2oLGjSoAhgvhw@mail.gmail.com>
Subject: Re: [GIT PULL] Allwinner DT changes for 5.19
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:F1nkDz9hdsTPf6j4ULY8cwnE6USkovWQTmNNzGD+VDgzoxSOZHn
 dxFUk6Oiyz3KBIDBKrCmUFYlw+bJjie4A9lX3QksQWQb4zm/Wc8vJVHud6jINmY7dXWsH44
 RE40MAAvwigdb45jDvw1/oxOOuTIjIiACqBjHrJmc5C+zJtSNC6frkdqg43mKjhF5lOuPo3
 hj3MQ2nvlU5u5U0wpiEhg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZG9cJ2hNppk=:1+KZ4QAH/1eybhti43rgLo
 d+cwBy7THFCApOgvKlnV3hTD+Iqwf2iN1RJT6VxSMmmAA1jkBZn0fOa13N1Lk6AwMaJAf/oKT
 aKyYvkw8hoDg3vYzx3t7aPI5Hg9oNtJgpK0uoz9qzOe89eWOTfARu1B6ZXFtB8oAd3xi3KBvU
 yqU2+qZ9/l+tlZ9Of09jDRTAm+4NdcZDKorz7CxeWCOa3Kd4riHVY81oHihlKXJTZSk5iwxYF
 lGg7JKGCOXJP2mHG0TSJdERormeW9xK7VziE7JSdp+0C2eLt8zFa6kjcV4pdTOuANCy+3p9Yw
 09TVU76LhGeJ7Ei0nQ9T0jir30MDnj+nFVbdSiHWf5ZYWup0VtSn2DTLn1qLFsF2BbmunVaGB
 Lqpoom8ZqE4CoZvHLJcJ7PXwhtfEEoIoslmf/62smrMeyAFeH683ObuWtK2f923aXUCG+GbZC
 wiFFIvCCox2Io1hi9SsqbXRHGuL7BtgUjqjBy0Qw/R+pPzh8KySAyZoW3Qsinj4qnfi6XrBxP
 Drbg5yTNik5X7AVAhZWIuBZi770QRaHn6DgNG9d/xEecnfyFTkqjGwbtZxtZJ+wCIuRCDvTZt
 dq7NIzPQihDt0Fd7aQC44BO1C5AMyymPGTiwi0qCUSqk+fLVIe20lSvW6gMtR3mBpyNIIdM+f
 36gPO+MSchYiJC/I7pt9WgZDEBXK/tqlsnPVJ7rOv6xwovQQThpoM+XqWyb2SL4/wuhB0VKcE
 JwKQANYZzg264WF17zH/fNvUEKBhN/1aTJvnGA+xpMTg/yGCvoYyHBX1iMm/EWHqQD+T22sZH
 v+Nf/HTv+3PxpbjOkgxqaeK/1t7Yhop8pY09kjNB3XaDjwSnKw=

On Sun, May 8, 2022 at 10:52 PM Jernej =C5=A0krabec <jernej.skrabec@gmail.c=
om> wrote:
>
> Dne petek, 06. maj 2022 ob 19:02:17 CEST je Jernej Skrabec napisal(a):
> > Hi!
> >
> > Please pull following DT changes for 5.19.
>
> I missed one patch, please disregard.

I had already merged this one, merging the new branch on top, while editing
the merge log to not mention the duplicate commits. You can always follow u=
p
with additional changes based on a branch that is already merged like this =
one.

        Arnd
