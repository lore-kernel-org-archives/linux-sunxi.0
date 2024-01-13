Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99A56122
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Jan 2024 17:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-35ff20816f7so63619945ab.1
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Jan 2024 09:29:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705166944; x=1705771744;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICsUNI7Afo1PaF9JpZaaVdJbx+JyaYF4RtdCTjtQr2E=;
        b=fIxgx6iRl5Ipf7Idj8/mN3wR5wyMBfUTkQuv25cElPBBdw8Zxj3lpv7b8HAky3YLjq
         rpFMhmE7m5KhHUJ5coTQwYfdlEAVFgSqkHfTNSfGcvb6TBic/FadW2g2gJNXm5ehfQeM
         P9mQVulgSWbhoiZE8Zkg0zWsXcpHlQuVlPZtSNzgelF49ja8bEpsUj5tIuQpiggItL5s
         ShYZBE1ybUtwDZVsCv5A50pA/dUT9Xx8Gu3YHf+qicTLC7kif2LOqJ0QBQaMXwaiV6TM
         sxcVF1rL9w1j5NGMSo67AceeXTlRpbOt4pWZl4vlY4Q3mOinh10PEzJAhFmiDMpzjydM
         pnVg==
X-Gm-Message-State: AOJu0YxLsUqFjtDiYUstdYkFgxX2deFGrJYPXjBb9Z6bwNuoQAcuwBAD
	5St6NKasnklprYhXQ54aplmjp/pnN14BdKZLrN0fjoC12Nvd
X-Google-Smtp-Source: AGHT+IHcLfzVAyzvzQwfkVETCBuZ267lqDZoU9EjATlm1vKKLELh2mnr630YV9hDNu5o4qUMvxVVbcfwfndUYj9z7niA2zqVDvIP
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1e0c:b0:360:5cc5:8ded with SMTP id
 g12-20020a056e021e0c00b003605cc58dedmr387058ila.3.1705166944013; Sat, 13 Jan
 2024 09:29:04 -0800 (PST)
Date: Sat, 13 Jan 2024 09:29:03 -0800
In-Reply-To: <00000000000026100c060e143e5a@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fb160f060ed71da5@google.com>
Subject: Re: [syzbot] [net?] [nfc?] INFO: task hung in nfc_targets_found
From: syzbot <syzbot+2b131f51bb4af224ab40@syzkaller.appspotmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, davem@davemloft.net, 
	dianders@chromium.org, dri-devel@lists.freedesktop.org, edumazet@google.com, 
	gregkh@linuxfoundation.org, hdanton@sina.com, jernej.skrabec@gmail.com, 
	krzysztof.kozlowski@linaro.org, kuba@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, mripard@kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, penguin-kernel@i-love.sakura.ne.jp, samuel@sholland.org, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com, 
	torvalds@linux-foundation.org, u.kleine-koenig@pengutronix.de, wens@csie.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

syzbot has bisected this issue to:

commit d665e3c9d37ad31aec2d0d9d086e7c903ddd7250
Author: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Date:   Sun May 7 16:26:06 2023 +0000

    drm/sun4i: Convert to platform remove callback returning void

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D146b91f5e800=
00
start commit:   acc657692aed keys, dns: Fix size check of V1 server-list h.=
.
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D166b91f5e800=
00
console output: https://syzkaller.appspot.com/x/log.txt?x=3D126b91f5e80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D5c882ebde8a5f3b=
4
dashboard link: https://syzkaller.appspot.com/bug?extid=3D2b131f51bb4af224a=
b40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D103698bde8000=
0
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D1617e0fbe80000

Reported-by: syzbot+2b131f51bb4af224ab40@syzkaller.appspotmail.com
Fixes: d665e3c9d37a ("drm/sun4i: Convert to platform remove callback return=
ing void")

For information about bisection process see: https://goo.gl/tpsmEJ#bisectio=
n
